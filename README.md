# FHV - Fortgeschrittene Webarchitekturen und Softwaredesign

# Gemeinsame Infrastruktur:
| Service  | Port |
|----------|------|
| Kafka    | 9092 | 
| Kafka UI | 5000 |

# Microservices:
| Service                 | Port | Kafka Topic Name        | DB-Port |
|-------------------------|------|-------------------------|---------|
| EventService            | 8081 | event_topic             | 38368   |
| EventServiceSolr        | 8983 |
| OrganizationService     | 8082 | organization_topic      | 6742    |
| TermregistrationService | 5173 | term_registration_topic | 5455    |


# API Dokumentation
## EventService
s. /swagger-ui/index.html

## OrganizationService
s. /swagger-ui/index.html

## TermregistrationService
s. /swagger/index.html

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
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmOTEwMTM2Ny1iNmQ2LTQ4MDgtYTljNy00ZjYxNzA3NjI3ZWEiLCJvcmdJZCI6IjQ3MTEiLCJyb2xlcyI6WyJBRE1JTiIsIk9SR0FOSVpFUiIsIkFDQ09VTlRBTlQiLCJURUFNQURNSU4iXSwiZXhwIjoxNzQ5NjI3MTk1LCJpc3MiOiJIb2xpZGF5UGxhbm5lciIsImF1ZCI6IkhvbGlkYXlQbGFubmVyIn0.PL_asGVml1Wm-tDOIs_4nVAiHNA7ZnsfdY5T5WZah18
```

Parsed to JSON
```JSON
{
  "sub": "f9101367-b6d6-4808-a9c7-4f61707627ea",
  "iss": "HolidayPlanner",
  "aud": "HolidayPlanner",
  "orgId": "4711",
  "roles": [
    "ADMIN",
    "ORGANIZER",
    "ACCOUNTANT",
    "TEAMADMIN"
  ],
  "exp": 1749627195
}
```
