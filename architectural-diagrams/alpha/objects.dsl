# objects for the alpha system
        group "Alpha Team" {

        }
        adam = person Administrator "Manages the system" "admin-tag" {
            url https://www.grc.com/
            properties {
                some-name "some value"
            }
            perspectives {
                ownership "Which team owns the object" team-alpha
            }
        }
        softwareSystem "Alpha" "System being diagrammed" "alpha-tag" {
            !docs documents
            !adrs decisions
            # group
            # container
            description "Does this override the description?"
            # tags
            # url
            # properties
            # perspectives
            adam -> this "Manages the system" "Chrome browser" "synchronous"
        }
        deploymentEnvironment k8s {
            # group
            # deploymentGroup
            # deploymentNode
        }
        # element


