# FHV - Fortgeschrittene Webarchitekturen und Softwaredesign

# Gemeinsame Infrastruktur:
| Service | Port  |
|----------|----------|
| Kafka | 9092 | 
| Kafka UI | 5000 |

# Microservices:
| Service | Port  | Kafka Topic Name | DB-Port |
|----------|----------|----------|----------|
| EventService | 8081 | event_topic | 38368
| EventServiceSolr | 8983 |
| OrganizationService | 8082 | organization_topic | 6742
| TermregistrationService | 5173 | term_registration_topic | 5455


# API Dokumentation
## EventService
s. /swagger-ui/index.html

## OrganizationService
s. /swagger-ui/index.html

## TermregistrationService
s. /swagger/index.html