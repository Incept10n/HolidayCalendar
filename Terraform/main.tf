resource "yandex_compute_instance" "default" {
  name                      = "hcalendar"
  platform_id               = "standard-v3"
  zone                      = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    disk_id = yandex_compute_disk.hcalendar_disk.id
  }

  network_interface {
    index     = 1
    subnet_id = yandex_vpc_subnet.hcalendar_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_vpc_network" "hcalendar_network" {
  name = "hcalendar_network"
}

resource "yandex_vpc_subnet" "hcalendar_subnet" {
  name           = "hcalendar_subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.hcalendar_network.id
  v4_cidr_blocks = ["10.5.0.0/24"]
}

resource "yandex_compute_disk" "hcalendar_disk" {
  name     = "hcalendar_disk"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  image_id = "fd864gbboths76r8gm5f"
  size     = 10
}