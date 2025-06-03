terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.142.0"
    }
  }

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "hcalendar-tf-bucket"
    region = "ru-central-a"
    key    = "tf-state"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  zone = "ru-central1-a"
}