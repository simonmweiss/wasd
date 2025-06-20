\c postgres
DROP DATABASE IF EXISTS term_db;
CREATE DATABASE term_db;

DO
$$
    BEGIN
        IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'termuser') THEN
            CREATE ROLE termuser LOGIN PASSWORD 'termUser_pw_geheim';
        END IF;
    END
$$;

GRANT ALL PRIVILEGES ON DATABASE term_db TO termuser;

\c term_db
DROP SCHEMA IF EXISTS public CASCADE;
DROP SCHEMA IF EXISTS term_read CASCADE;
CREATE SCHEMA public;
CREATE SCHEMA term_read;

GRANT ALL PRIVILEGES ON SCHEMA public TO termuser;
GRANT USAGE ON SCHEMA term_read TO termuser;

CREATE TABLE IF NOT EXISTS public.terms
(
    term_id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    event_id         VARCHAR(255) NOT NULL,
    start_time       TIMESTAMP    NOT NULL,
    end_time         TIMESTAMP    NOT NULL,
    location         VARCHAR(255) NOT NULL,
    meeting_point    VARCHAR(255),
    min_participants INTEGER CHECK (min_participants >= 1),
    max_participants INTEGER,
    price            DOUBLE PRECISION CHECK (price >= 0)
);

CREATE TABLE IF NOT EXISTS public.term_caregiver_ids
(
    term_id       UUID NOT NULL REFERENCES public.terms (term_id) ON DELETE CASCADE,
    caregiver_ids VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS public.outbox
(
    id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    aggregate_type VARCHAR(255),
    aggregate_id   UUID,
    payload        TEXT,
    event_type     VARCHAR(255),
    created_at     TIMESTAMP,
    sent           BOOLEAN          DEFAULT FALSE
);

-- Schema term_read
CREATE SCHEMA IF NOT EXISTS term_read;

CREATE TABLE IF NOT EXISTS term_read.terms
(
    term_id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    event_id         VARCHAR(255) NOT NULL,
    start_time       TIMESTAMP    NOT NULL,
    end_time         TIMESTAMP    NOT NULL,
    location         VARCHAR(255) NOT NULL,
    meeting_point    VARCHAR(255),
    min_participants INTEGER CHECK (min_participants >= 1),
    max_participants INTEGER,
    price            DOUBLE PRECISION CHECK (price >= 0)
);

CREATE TABLE IF NOT EXISTS term_read.term_caregiver_ids
(
    term_id       UUID NOT NULL REFERENCES term_read.terms (term_id) ON DELETE CASCADE,
    caregiver_ids VARCHAR(255)
);


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO termuser;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA term_read TO termuser;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO termuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA term_read GRANT ALL ON TABLES TO termuser;