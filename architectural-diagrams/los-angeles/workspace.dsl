# provides details about System Bravo
workspace extends ../system-catalog.dsl {
    name "Boston"
    description "Services maintained at the Los Angeles site"
    !docs documents
    !adrs decisions

    model {
        !element fulfillment {
            service = container "Order Fulfillment Service" "Spring Boot"
            schema = container "Order Fulfillment Schema" "PostgreSQL" {
                orderFulfillmentTable = component "order_fulfillment" "Order Fulfillment Table" "PostgreSQL"
                auditTable = component "audit" "Audit Table" "PostgreSQL"
            }

            service -> orderFulfillmentTable "Reads from and writes to" "Spring Data JDBC"
            service -> auditTable "Records all operations to" "Spring Data JDBC"
            orchestrator -> service "Sends requests to" "JSON over HTTP"
        }
    }

    views {
        systemContext fulfillment "fulfillment-SystemContext" "High level view" {
            include *
            autolayout lr
        }

        container fulfillment "fulfillment-Containers" "Deployable artifacts" {
            include *
            autolayout
        }

        component schema "schema-component" "Database tables" {
            include *
            autolayout
        }

    }

    configuration {
        scope softwaresystem
        visibility public
    }
}
