workspace alpha-system "Describe a single software system" {
    properties {
        name "value"
    }

    !identifiers flat
    !docs documents
    !adrs decisions

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
            # !docs
            # !adrs
            # group
            # container
            description "Does this override the description?"
            # tags
            # url
            # properties
            # perspectives
            adam -> this "Administers" "JSON over HTTPS" "synchronous"
        }
        deploymentEnvironment k8s {
            # group
            # deploymentGroup
            # deploymentNode
        }
        # element
    }

    views {
        systemLandscape Alpha "High level view" {
            include *
            # exclude
            # autoLayout tb 300 300
            default
            # animation
            title "some title"
            description "does this override the view description?"
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