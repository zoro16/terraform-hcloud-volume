################################################
# Volume
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume
################################################

resource "hcloud_volume" "vol" {
  count = var.create_volume ? 1 : 0

  name              = var.volume_name
  size              = var.volume_size
  server_id         = var.volume_server_id
  location          = var.volume_location
  automount         = var.volume_automount
  format            = var.volume_format
  delete_protection = var.volume_delete_protection
}


################################################
# Volume Attachment
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume_attachment
################################################

resource "hcloud_volume_attachment" "vol_attach" {
  count = var.create_volume_attachment ? 1 : 0

  volume_id = var.volume_attachment_volume_id
  server_id = var.volume_attachment_server_id
  automount = var.volume_attachment_automount
}
