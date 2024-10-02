workspace {
    model {
        user = person "Clientes"

        system = softwareSystem "Sistema de Entrega de Comida" {
            webApp = container "Aplicación Web" "React" "El frontend que interactúa con los clientes y dueños de restaurantes."
            apiGateway = container "API Gateway" "Nginx / Go" "Coordina todas las peticiones a los microservicios."
            
            restaurantService = container "Servicio de Restaurantes" "Go" "Gestiona el menú, los pedidos y la disponibilidad del restaurante." {
                restaurantController = component "RestaurantController" "Gestiona las solicitudes HTTP para restaurantes."
                restaurantServiceLayer = component "RestaurantService" "Procesa la lógica de negocio."
                restaurantRepository = component "RestaurantRepository" "Gestiona el acceso a los datos del restaurante."
                db = component "Database" "PostgreSQL" "Almacena datos de restaurantes."
                
                restaurantController -> restaurantServiceLayer "Llama a"
                restaurantServiceLayer -> restaurantRepository "Llama a"
                restaurantRepository -> db "Lee y escribe en"
            }


        }

        user -> webApp "Utiliza"
        webApp -> apiGateway "Envía solicitudes"
        apiGateway -> restaurantService "Pasa solicitudes de gestión de restaurantes"
    }

    views {
        component restaurantService {
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
