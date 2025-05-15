# FHV - Fortgeschrittene Webarchitekturen und Softwaredesign

# Gemeinsame Infrastruktur:
| Service | Port  |
|----------|----------|
| Apache Solr | 8983 |
| Kafka | 9092 | 
| Kafka UI | 5000 |

# Microservices:
| Service | Port  | Kafka Topic Name | DB-Port |
|----------|----------|----------|----------|
| EventService | 8081 | event_topic | 38368
| OrganizationService | 8082 | organization_topic | 6742
