################################################
# Volume
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume
################################################

output "volume_name" {
  description = "Name of the Volume to be created."
  value       = module.vol.volume_name
}

output "volume_id" {
  description = "Unique ID of the volume."
  value       = module.vol.volume_id
}

output "volume_server_id" {
  description = "Server to attach the Volume to, not allowed if location argument is passed."
  value       = module.vol.volume_server_id
}

output "volume_location" {
  description = "The location name of the volume to create, not allowed if `server_id` argument is passed."
  value       = module.vol.volume_location
}

output "volume_size" {
  description = "Size of the Volume to be created in GB."
  value       = module.vol.volume_size
}

output "volume_format" {
  description = "Format volume after creation. `xfs` or `ext4`."
  value       = module.vol.volume_format
}

output "volume_labels" {
  description = "User-defined labels (key-value pairs)."
  value       = module.vol.volume_labels
}

output "volume_linux_device" {
  description = "Device path on the file system for the Volume."
  value       = module.vol.volume_linux_device
}

output "volume_delete_protection" {
  description = "Enable or disable delete protection."
  value       = module.vol.volume_delete_protection
}
