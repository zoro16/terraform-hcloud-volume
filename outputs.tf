################################################
# Volume
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume
################################################

output "volume_name" {
  description = "Name of the Volume to be created."
  value       = try(hcloud_volume.vol[0].name, hcloud_volume.vol[*].name)
}

output "volume_id" {
  description = "Unique ID of the volume."
  value       = try(hcloud_volume.vol[0].id, hcloud_volume.vol[*].id)
}

output "volume_server_id" {
  description = "Server to attach the Volume to, not allowed if location argument is passed."
  value       = try(hcloud_volume.vol[0].server_id, hcloud_volume.vol[*].server_id)

  precondition {
    condition     = (var.volume_server_id != null && var.volume_location != null) ? false : true
    error_message = "Only one of server or location must be provided."
  }
}

output "volume_location" {
  description = "The location name of the volume to create, not allowed if `server_id` argument is passed."
  value       = try(hcloud_volume.vol[0].location, hcloud_volume.vol[*].location)

  precondition {
    condition     = (var.volume_server_id != null && var.volume_location != null) ? false : true
    error_message = "Only one of server or location must be provided."
  }
}

output "volume_size" {
  description = "Size of the Volume to be created in GB."
  value       = try(hcloud_volume.vol[0].size, hcloud_volume.vol[*].size)
}

output "volume_format" {
  description = "Format volume after creation. `xfs` or `ext4`."
  value       = try(hcloud_volume.vol[0].format, hcloud_volume.vol[*].format)
}

output "volume_labels" {
  description = "User-defined labels (key-value pairs)."
  value       = try(hcloud_volume.vol[0].labels, hcloud_volume.vol[*].labels)
}

output "volume_linux_device" {
  description = "Device path on the file system for the Volume."
  value       = try(hcloud_volume.vol[0].linux_device, hcloud_volume.vol[*].linux_device)
}

output "volume_delete_protection" {
  description = "Enable or disable delete protection."
  value       = try(hcloud_volume.vol[0].delete_protection, hcloud_volume.vol[*].delete_protection)
}


################################################
# Volume Attachment
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume_attachment
################################################

output "volume_attachment_id" {
  description = "Unique ID of the Volume Attachment."
  value       = try(hcloud_volume_attachment.vol_attach[0].id, hcloud_volume_attachment.vol_attach[*].id, "")
}

output "volume_attachment_volume_id" {
  description = "ID of the Volume."
  value       = try(hcloud_volume_attachment.vol_attach[0].volume_id, hcloud_volume_attachment.vol_attach[*].volume_id, "")
}

output "volume_attachment_server_id" {
  description = "Server to attach the Volume to."
  value       = try(hcloud_volume_attachment.vol_attach[0].server_id, hcloud_volume_attachment.vol_attach[*].server_id, "")
}
