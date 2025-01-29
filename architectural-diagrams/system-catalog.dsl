# maintained by architecture, creating placeholders for each system. Details are filled in by team owners in their own workspace.
workspace system-catalog "Collection of all actors and systems, but no details" {

    !identifiers hierarchical

    model {
        group "Montreal" {
            webSite = softwareSystem "Web Site"
            orchestrator = softwareSystem "Orchestrator"
        }

        group "Boston" {
            orderPlacement = softwareSystem "Order Placement"
            payment = softwareSystem "Payment"
        }

        group "Los Angeles" {
            fulfillment = softwareSystem "Fulfillment"
            email = softwareSystem "email"
        }
    }

}

