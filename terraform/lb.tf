# resource "yandex_lb_network_load_balancer" "app-1" {
#   name = "my-network-load-balancer"

#   listener {
#     name = "app-1-listener"
#     port = 9292
#     external_address_spec {
#       ip_version = "ipv4"
#     }
#   }

#   attached_target_group {
#     target_group_id = "${yandex_lb_target_group.app-1-target-group.id}"
#     healthcheck {
#       name = "http"
#       http_options {
#         port = 9292
#       }
#     }
#   }
# }

# resource "yandex_lb_target_group" "app-1-target-group" {
#   name      = "app-1-target-group"
#   region_id = "ru-central1"

#   target {
#     subnet_id = var.subnet_id
#     address   = "${yandex_compute_instance.app.network_interface.0.ip_address}"
#   }
# }
