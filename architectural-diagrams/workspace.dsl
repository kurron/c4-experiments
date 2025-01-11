# https://github.com/structurizr/dsl/blob/master/docs/language-reference.md

#(Person|SoftwareSystem|Container|Component|DeploymentNode|InfrastructureNode|SoftwareSystemInstance|ContainerInstance|Custom)

!const CODE_NAME "Project Alpha"
!const GROUP_NAME "Group"

/*
multi line
*/

# single line
// single line

workspace "Can C4 Handle Large Diagrams" {
    !identifiers flat
    !impliedRelationships true
   #!include <file|directory|url>

    !docs documents
    !adrs decisions

    !const FOO "Some text you want to reuse."

    model {
        group "Business Unit Alpha" {
            xray = softwareSystem "Xray" {
                description "Some system"
            }
            whiskey = softwareSystem "Whiskey" {
                description "Microservice modeled as a software system"
                picon = container "Picon Service" {
                    description "Picon business logic"
                    technology "Spring Boot"
                }
                geminon = container "Geminon Service" {
                    description "Geminon business logic"
                    technology "Spring Boot"
                }
                container "Baltar Service" {
                    description "Baltar business logic"
                    technology "AWS Lambda"
                }
            }
            softwareSystem "Shared Database Schema" {
                description "Possible anti-pattern"
                orderPlacementService = container "Alpha schema" {
                    description "Alpha tables"
                    technology "PostgreSQL"
                    component "Inventory" {
                        description "inventory"
                        technology "table"
                        picon -> this "modify product pricing data" "Spring Data JDBC" "sync-one-way" {
                        }
                    }
                    component "Customer" {
                        description "customer"
                        technology "table"
                        whiskey -> this "modify customer data" "Spring Data JDBC" "sync-one-way" {
                        }
                    }
                    component "Points" {
                        description "loyalty_points"
                        technology "materialized view"
                        xray -> this "load loyalty data" "Spring Data JDBC" "sync-one-way" {
                        }
                    }
                }
            }
        }
        group "Business Unit Bravo" {
            yankee = softwareSystem "Yankee" {
                description "Microservice"
            }
            victor = softwareSystem "Victor" {
                description "Microservice"
            }
        }
        group "Business Unit Charlie" {
            softwareSystem "Zulu" {
                description "Owned by another team"
                victor -> this "access Victor functionality" "JSON over HTTP" "sync-one-way" {
                }
            }
            uniform = softwareSystem "Uniform" {
                description "Owned by another team"
                yankee -> this "access Yankee functionality" "JSON over HTTP" "sync-one-way" {
                }
            }
        }
    }

    # https://visme.co/blog/website-color-schemes/
    views {
        #theme default
        theme https://static.structurizr.com/themes/microsoft-azure-2021.01.26/theme.json
        styles {
            element "MessageBroker" {
                shape Cylinder
                background #E8A87C
            }
            element "DataStore" {
                shape Cylinder
                background #E27D60
            }
            element "Cron" {
                shape Robot
            }
            element "FileStore" {
                shape Folder
                background #dac292
            }
            # shape <Box|RoundedBox|Circle|Ellipse|Hexagon|Cylinder|Pipe|Person|Robot|Folder|WebBrowser|MobileDevicePortrait|MobileDeviceLandscape|Component>
            element "Channel" {
                shape Pipe
                background #C38D9E
            }
            element "Channel Adapter" {
                shape Ellipse
                background #41B3A3
            }
            element "Microservice" {
                shape Hexagon
            }
            element "CommandLine" {
                shape Box
            }
            element "WebUI" {
                shape WebBrowser
            }

            relationship "async-one-way" {
                thickness 2
                style dotted
                color #242582
            }
            relationship "sync-one-way" {
                thickness 2
                style solid
                color #0000FF
            }
            relationship "sync-two-way" {
                thickness 2
                style solid
                color #553D67
            }
            relationship "json-over-mongodb-wire-protocol" {
                thickness 2
                style dotted
                color #F64C72
            }
            relationship "jdbc-driver" {
                thickness 2
                style dotted
                color #F64C72
            }
        }
/*
        # from misconception talk
        container buymore {
            include ->database->
        }
        container buymore {
            include ->orderPlacementService->
        }
        container buymore {
            include ->paymentService->
        }
        container buymore {
            include ->fulfillmentService->
        }
        container buymore {
            include ->emailService->
        }
        container buymore {
            include ->orchestrator->
        }
       container buymore {
           include orderPlacementService emailService
       }
*/
    }
}