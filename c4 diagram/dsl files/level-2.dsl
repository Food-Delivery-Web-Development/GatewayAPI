workspace {
    model {
        user = person "Clientes"

        system = softwareSystem "Sistema de Entrega de Comida" {
            webApp = container "Aplicación Web" "React" "El frontend que interactúa con los clientes y dueños de restaurantes."
            apiGateway = container "API Gateway" "Nginx / Go" "Coordina todas las peticiones a los microservicios."

            restaurantService = container "Servicio de Restaurantes" "Go" "Gestiona el menú, los pedidos y la disponibilidad del restaurante."
            orderService = container "Servicio de Pedidos" "Go" "Gestiona los pedidos de los clientes."
            userService = container "Servicio de Usuarios" "Go" "Gestiona la información de los clientes, repartidores y dueños de restaurantes."
            notificationService = container "Servicio de Notificaciones" "Go" "Envía notificaciones por SMS y correos electrónicos."

            db = container "Base de Datos Gateway" "PostgreSQL" "Distribuye los datos en dioferentes bases de datos"

            db1 = container "Replica 1" "PostgreSQL" "Guarda los datos"
            db2 = container "Replica 2" "PostgreSQL" "Guarda los datos"
            db3 = container "Replica 3" "PostgreSQL" "Guarda los datos"
        }

        user -> webApp "Utiliza"

        webApp -> apiGateway "Envía solicitudes"

        apiGateway -> restaurantService "Pasa solicitudes de gestión de restaurantes"
        apiGateway -> orderService "Pasa solicitudes de gestión de pedidos"
        apiGateway -> userService "Pasa solicitudes de gestión de usuarios"
        apiGateway -> notificationService "Pasa solicitudes de notificaciones"

        restaurantService -> db "Lee y escribe datos"
        orderService -> db "Lee y escribe datos"
        userService -> db "Lee y escribe datos"

        db -> db1 ""
        db -> db2 ""
        db -> db3 ""
    }

    views {
        container system {
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
