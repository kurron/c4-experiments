# provides details about System Charlie
workspace extends ../system-catalog.dsl {
    name "Montreal"
    description "Services maintained at the Montreal site"
    !docs documents
    !adrs decisions

    model {
        !element orchestrator {
            service = container "Workflow Orchestration" "Spring Boot"
            schema = container "Orchestration Schema" "PostgreSQL" {
                auditTable = component "audit" "Audit Table" "PostgreSQL"
            }

            service -> orderPlacement "Sends request to" "JSON over HTTP"
            service -> payment "Sends request to" "JSON over HTTP"
            service -> fulfillment "Sends request to" "JSON over HTTP"
            service -> email "Sends request to" "JSON over HTTP"
            webSite -> service "Sends requests to" "JSON over HTTP"
            service -> auditTable "Records all operations to" "Spring Data JDBC"
        }
    }

    views {
        systemContext orchestrator "Orchestrator-SystemContext" "High level view" {
            include *
            autolayout lr
        }

        container orchestrator "Orchestrator-Containers"  "Deployable artifacts" {
            include *
            autolayout
        }

        component schema "schema-component" "Database Tables" {
            include *
            autolayout
        }

    }

    configuration {
        scope softwaresystem
        visibility public
    }
}
