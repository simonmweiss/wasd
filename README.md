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

# For Compose
Add all your Services to the profile group "service", to avoid errors with kafka
E.g.:    
    
    profiles:
      [service]

# Start up

* Start Kafka Services
    * docker compose up
* Start **Our** Services
    * docker compose --profile service up