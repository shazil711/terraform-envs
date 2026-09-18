module "networking" {
  source = "git::https://github.com/shazil711/terraform-gcp-modules.git//modules/networking?ref=v1.0.0"

  project_id   = var.project_id
  region       = var.region
  network_name = "prod-network"
  subnet_name  = "prod-subnet"
  subnet_cidr  = "10.0.1.0/24"
}

module "compute" {
  source = "git::https://github.com/shazil711/terraform-gcp-modules.git//modules/compute?ref=v1.0.0"

  project_id    = var.project_id
  instance_name = "prod-vm"
  zone          = var.zone
  machine_type  = "e2-micro"          # required by the module
  network_id    = module.networking.network_id
  subnet_id     = module.networking.subnet_id
  tags          = ["http-server", "ssh-server"]
}
# trigger 1789723085
