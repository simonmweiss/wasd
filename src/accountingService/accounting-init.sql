\c postgres
DROP DATABASE IF EXISTS accounting_db;
CREATE DATABASE accounting_db;

DO
$$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'accountinguser') THEN
CREATE ROLE accountinguser LOGIN PASSWORD 'accountingUser_pw_geheim';
END IF;
END
$$;

GRANT ALL PRIVILEGES ON DATABASE accounting_db TO accountinguser;

\c accounting_db

DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;
GRANT ALL PRIVILEGES ON SCHEMA public TO accountinguser;

-- Table for Payment entity
CREATE TABLE IF NOT EXISTS payment_records
(
    payment_id       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id          VARCHAR(255)     NOT NULL,
    term_id          VARCHAR(255)     NOT NULL,
    amount           DOUBLE PRECISION NOT NULL,
    payment_date     DATE,
    payment_deadline DATE,
    status           VARCHAR(20)      NOT NULL
    );

-- Table for SponsorPayment entity
CREATE TABLE IF NOT EXISTS sponsor_payments
(
    sponsor_payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sponsor_id         VARCHAR(255) NOT NULL,
    organization_id    VARCHAR(255) NOT NULL,
    amount             DOUBLE PRECISION,
    payment_status     VARCHAR(20)  NOT NULL
    );

-- Table for Expense entity
CREATE TABLE IF NOT EXISTS expenses
(
    expense_id     UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title          VARCHAR(255) NOT NULL,
    description    TEXT,
    amount         DOUBLE PRECISION NOT NULL,
    date           DATE NOT NULL,
    payment_status VARCHAR(20) NOT NULL
    );


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO accountinguser;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO accountinguser;
