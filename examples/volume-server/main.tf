# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}


module "sv" {
  source  = "zoro16/server/hcloud"
  version = "1.0.0"

  create_server = true

  server_name = "sample-server"
  server_type = "cax11"
  location    = "fsn1"
  backups     = true
  image       = "debian-12"

  placement_group_name = "placement-group-sample"

  public_net_ipv4_enabled = true
  public_net_ipv6_enabled = true
}

module "vol" {
  source = "../../"

  create_volume    = true
  volume_size      = 10
  volume_name      = "example-vol1"
  volume_automount = false
  volume_format    = "xfs"
  volume_server_id = module.sv.server_id
  # volume_location = "fsn1"
}
