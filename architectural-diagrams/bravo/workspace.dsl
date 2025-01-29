# provides details about System Bravo
workspace extends ../system-catalog.dsl {

    model {
        !element b {
            webapp = container "Bravo Web Application"
            database = container "Bravo Database"

            #webapp -> b "Gets data X from"
            webapp -> database "Reads from and writes to"
        }
    }

    views {
        systemContext b "B-SystemContext" {
            include *
            autolayout lr
        }

        container b "B-Containers" {
            include *
            autolayout
        }
    }

}
