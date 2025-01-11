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
            softwareSystem "Xray" {
                description "Some system"
                perspectives {
                }
            }
            softwareSystem "Whiskey" {
                description "Some system"
                perspectives {
                }
            }
        }
        group "Business Unit Bravo" {
            softwareSystem "Yankee" {
                description "Some system"
                perspectives {
                }
            }
            softwareSystem "Victor" {
                description "Some system"
                perspectives {
                }
            }
        }
        group "Business Unit Charlie" {
            softwareSystem "Zulu" {
                description "Some system"
                perspectives {
                }
            }
            softwareSystem "Uniform" {
                description "Some system"
                perspectives {
                }
            }
        }
    }

    # https://visme.co/blog/website-color-schemes/
    views {
        theme default
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