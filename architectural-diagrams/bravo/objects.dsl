# reusable objects for the Bravo system
        group "Bravo Team" {

        }
        ben = person "Power User" "Manages the system" "admin-tag" {
            url https://www.grc.com/
            properties {
                some-name "some value"
            }
            perspectives {
                ownership "Which team owns the object" team-alpha
            }
        }
        softwareSystem "Bravo" "System being diagrammed" "bravo-tag" {
            !docs documents
            !adrs decisions
            # group
            # container
            description "Does this override the description?"
            # tags
            # url
            # properties
            # perspectives
            ben -> this "Manages the system" "Chrome browser" "synchronous"
        }
        deploymentEnvironment k8sX {
            # group
            # deploymentGroup
            # deploymentNode
        }
        # element
