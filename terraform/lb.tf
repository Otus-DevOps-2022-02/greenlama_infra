resource "yandex_lb_network_load_balancer" "app_lb" {
  name = "my-network-load-balancer"
  region_id = "ru-central1"
  listener {
    name         = "app-listener"
    port         = 9292
    target_port  = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.app_lb_group.id
    healthcheck {
      name = "http"
      http_options {
        port = 9292
      }
    }
  }
}

resource "yandex_lb_target_group" "app_lb_group" {
  name      = "app-target"
  region_id = "ru-central1"
  dynamic "target" {
    for_each = yandex_compute_instance.app.*.network_interface.0.ip_address
    content {
      subnet_id = var.subnet_id
      address   = target.value
    }
  }
}
