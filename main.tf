resource "yandex_compute_instance" "srv74-01" {
  name                      = "srv74-01"
  zone                      = "ru-central1-a"
  hostname                  = "srv74-01.netology.lab"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.centos-7-base}"
      name        = "root-srv74-01"
      type        = "network-nvme"
      size        = "50"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.default.id}"
    nat       = true
  }
}
