# provides details about System Alpha
workspace extends ../system-catalog.dsl {

    model {
        !element alpha {
            webapp = container "Alpha Web Application"
            database = container "Alpha Database"

            webapp -> b "Gets data X from"
            webapp -> database "Reads from and writes to"
        }
    }

    views {
        systemContext alpha "Alpha-SystemContext" {
            include *
            autolayout lr
        }

        container alpha "A-Containers" {
            include *
            autolayout
        }
    }

}
