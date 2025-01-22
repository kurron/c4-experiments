workspace alpha-system "Describe a single software system" {
    properties {
        name "value"
    }

    !identifiers flat
    !docs documents/workspace
    !adrs decisions/workspace

    model {
        group "Alpha Team" {

        }
        group "Bravo Team" {

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
            !docs documents/alpha
            !adrs decisions/alpha
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
    }

    views {
        systemLandscape system-landscape {
            include *
            # exclude
            # autoLayout tb 300 300
            default
            # animation
            title "High level interactions"
            description "Highest view of the system and its collaborators"
            # properties
        }

        # systemContext
        # container
        # component
        # filtered
        # dynamic
        # deployment
        # custom
        # image
        # styles
        theme default
        # themes
        # branding
        # terminology
        # properties
    }

    configuration {
        scope SoftwareSystem
    }
}