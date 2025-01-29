# provides details about System Alpha
workspace extends ../system-catalog.dsl {
    name "Boston"
    description "Services maintained at the Boston site"
    !docs documents
    !adrs decisions

    model {
        !element orderPlacement {
            service = container "Order Placement Service" "Spring Boot"
            schema = container "Order Placement Schema" "PostgreSQL" {
                orderPlacementTable = component "order_placement" "Order Placement Table" "PostgreSQL"
                auditTable = component "audit" "Audit Table" "PostgreSQL"
            }

            service -> orderPlacementTable "Reads from and writes to" "Spring Data JDBC"
            service -> auditTable "Records all operations to" "Spring Data JDBC"
            orchestrator -> service "Sends requests to" "JSON over HTTP"
        }
    }

    views {
        systemContext orderPlacement "Order-SystemContext" "High level view" {
            include *
            autolayout lr
        }

        container orderPlacement "Order-Containers"  "Deployable artifacts" {
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
