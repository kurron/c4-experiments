# provides details about all systems
workspace extends system-catalog.dsl {

    !docs documents
    !adrs decisions

    model {
        webSite -> orchestrator "Sends requests to" "JSON over HTTP"
        orchestrator -> orderPlacement "Sends requests to" "JSON over HTTP"
        orchestrator -> payment "Sends requests to" "JSON over HTTP"
        orchestrator -> fulfillment "Sends requests to" "JSON over HTTP"
        orchestrator -> email "Sends requests to" "JSON over HTTP"
    }

    views {
        systemLandscape "landcape-view" "High level view of all systems" {
            include *
            autolayout
        }
    }

    configuration {
        scope landscape
        visibility public
    }
}
