# FHV - Fortgeschrittene Webarchitekturen und Softwaredesign

# Gemeinsame Infrastruktur:
| Service  | Port |
|----------|------|
| Kafka    | 9092 | 
| Kafka UI | 5000 |

# Microservices:
| Service                 | Port | Kafka Topic Name            | DB-Port |
|-------------------------|------|-----------------------------|---------|
| EventService            | 8081 | event_topic                 | 38368   |
| EventServiceSolr        | 8983 |
| OrganizationService     | 8082 | organization_topic          | 6742    |
| TermregistrationService | 5173 | term_registration_topic     | 5455    |
| AccountingService       | 6900 | starting with accounting... | 2345    |
| TermService             | 6901 | term_topic                  | 2346    |


# API Dokumentation
## EventService
s. /swagger-ui/index.html

## OrganizationService
s. /swagger-ui/index.html

## TermregistrationService
s. /swagger/index.html

## TermService
s. /swagger-ui

## AccountingService
s. /swagger-ui

# Tipp
Aktuell braucht das `docker-compose.yaml`-file über 1 GB um alle images zu pullen (und es fehlen noch einige). Bitte genug Zeit einplanen um alles runter zu laden.

| Image                   | Größe     |
|-------------------------|-----------|
| kafka                   | 230,7  MB |
| kafkaui                 |  39,84 MB |
| solr                    | 451,1  MB |
| postgres                | 128,1  MB |
| eventservice            |  90,64 MB |
| termregistrationservice |  32,38 MB |
| organizationservice     | 337    MB |
|                         |           |
| Summe                   |   1,3  GB |

# JWT
## Secret
`FortWebArch_Bierkoenig_12345678!`

## Sample JWT
Base64 encoded
```
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmOTEwMTM2Ny1iNmQ2LTQ4MDgtYTljNy00ZjYxNzA3NjI3ZWEiLCJpc3MiOiJIb2xpZGF5UGxhbm5lciIsImF1ZCI6IkhvbGlkYXlQbGFubmVyIiwib3JnSWQiOiJmNGEyZDMwYy1iNGNkLTRiOTMtYmYyNi0wMzNmYmFlYzhjMDkiLCJyb2xlcyI6WyJBRE1JTiIsIk9SR0FOSVpFUiIsIkFDQ09VTlRBTlQiLCJURUFNQURNSU4iXSwiZXhwIjoxNzY1OTUzODE0fQ.200jDphB9rsodlYes3k7M3dtOI72x7GVUzakCGMxzLA
```

Parsed to JSON
```JSON
{
  "sub": "f9101367-b6d6-4808-a9c7-4f61707627ea",
  "iss": "HolidayPlanner",
  "aud": "HolidayPlanner",
  "orgId": "f4a2d30c-b4cd-4b93-bf26-033fbaec8c09",
  "roles": [
    "ADMIN",
    "ORGANIZER",
    "ACCOUNTANT",
    "TEAMADMIN"
  ],
  "exp": 1765953814
}
```
