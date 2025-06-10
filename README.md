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
`FortWebArch_Bierkoenig_123!`
## Sample JWT
`{  "sub": "913d1e92-7400-4869-8f5a-c918531a6305",  "orgId": 4711,  "roles": ["ADMIN", "ORGANIZER", "ACCOUNTANT", "TEAMADMIN"],  "iat": 1678886400, // March 15, 2023 00:00:00 GMT  "exp": 1678890000  // March 15, 2023 01:00:00 GMT}`
