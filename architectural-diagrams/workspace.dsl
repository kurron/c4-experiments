

workspace all-systems "Describe multiple software systems" {
    properties {
        name "value"
    }

    !identifiers flat

    model {
        #!include <file|directory|url>
        !include alpha/objects.dsl
        !include bravo/objects.dsl
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
        # scope <landscape|softwaresystem|none>
        scope None
    }
}