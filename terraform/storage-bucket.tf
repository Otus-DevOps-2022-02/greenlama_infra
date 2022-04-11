#fake_backend
terraform {
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    key                         = "prod-state.tfstate"
    region                      = "ru-central1"
    bucket                      = "otus-tf-state"
    skip_region_validation      = "true"
    skip_credentials_validation = "true"
    access_key                  = "YCAJE_fakeuiEIM6OF1wYUcC"
    secret_key                  = "YCN1kpwUvmLZHyykqZLC4-fakeUzJwROGOwJgTE3"
  }
}
