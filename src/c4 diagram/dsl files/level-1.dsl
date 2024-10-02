workspace {
    model {
        user = person "Cliente" {
            description "Cliente que hace pedidos y recibe comida."
        }
        deliveryPerson = person "Repartidor" {
            description "Repartidor que entrega los pedidos."
        }
        restaurantOwner = person "Dueño del Restaurante" {
            description "Dueño del restaurante que gestiona el menú y los pedidos."
        }

        system = softwareSystem "Sistema de Entrega de Comida" {
            description "Sistema para gestionar pedidos de comida a domicilio."
        }

        user -> system "Hace pedidos"
        deliveryPerson -> system "Ve pedidos para entregar"
        restaurantOwner -> system "Gestiona menú y pedidos"
    }

    views {
        systemContext system {
            include *
            autolayout lr
        }

        styles {
        element "Element" {
            shape roundedbox
        }
        element "Person" {
            background #08427b
            color #ffffff
        }
        element "Container" {
            background #1168bd
            color #ffffff
        }
        element "Component" {
            background #2a4e6e
            color #ffffff
        }
        }
    }
}
