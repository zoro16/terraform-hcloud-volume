## Description

Terraform module to provision `Volume` and `Volume Attachment` resources in Hetzner Cloud.


## Usage

```hcl
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
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.42.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | >= 1.42.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_volume.vol](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume) | resource |
| [hcloud_volume_attachment.vol_attach](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_volume"></a> [create\_volume](#input\_create\_volume) | A boolean to check whether to create a Volume or not. | `bool` | `false` | no |
| <a name="input_create_volume_attachment"></a> [create\_volume\_attachment](#input\_create\_volume\_attachment) | A boolean to check whether to create a Volume Attachment or not. | `bool` | `false` | no |
| <a name="input_volume_attachment_automount"></a> [volume\_attachment\_automount](#input\_volume\_attachment\_automount) | Automount the volume upon attaching it. | `bool` | `false` | no |
| <a name="input_volume_attachment_server_id"></a> [volume\_attachment\_server\_id](#input\_volume\_attachment\_server\_id) | Server to attach the Volume to. | `number` | `null` | no |
| <a name="input_volume_attachment_volume_id"></a> [volume\_attachment\_volume\_id](#input\_volume\_attachment\_volume\_id) | ID of the Volume. | `number` | `null` | no |
| <a name="input_volume_automount"></a> [volume\_automount](#input\_volume\_automount) | Automount the volume upon attaching it (server\_id must be provided). | `bool` | `true` | no |
| <a name="input_volume_delete_protection"></a> [volume\_delete\_protection](#input\_volume\_delete\_protection) | Enable or disable delete protection. | `bool` | `false` | no |
| <a name="input_volume_format"></a> [volume\_format](#input\_volume\_format) | Format volume after creation. `xfs` or `ext4` | `string` | `"xfs"` | no |
| <a name="input_volume_location"></a> [volume\_location](#input\_volume\_location) | The location name of the volume to create, not allowed if `server_id` argument is passed. | `string` | `null` | no |
| <a name="input_volume_name"></a> [volume\_name](#input\_volume\_name) | Name of the Volume to be created. | `string` | `""` | no |
| <a name="input_volume_server_id"></a> [volume\_server\_id](#input\_volume\_server\_id) | Server to attach the Volume to, not allowed if location argument is passed. | `number` | `null` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Size of the Volume to be created in GB. | `number` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_volume_attachment_id"></a> [volume\_attachment\_id](#output\_volume\_attachment\_id) | Unique ID of the Volume Attachment. |
| <a name="output_volume_attachment_server_id"></a> [volume\_attachment\_server\_id](#output\_volume\_attachment\_server\_id) | Server to attach the Volume to. |
| <a name="output_volume_attachment_volume_id"></a> [volume\_attachment\_volume\_id](#output\_volume\_attachment\_volume\_id) | ID of the Volume. |
| <a name="output_volume_delete_protection"></a> [volume\_delete\_protection](#output\_volume\_delete\_protection) | Enable or disable delete protection. |
| <a name="output_volume_format"></a> [volume\_format](#output\_volume\_format) | Format volume after creation. `xfs` or `ext4`. |
| <a name="output_volume_id"></a> [volume\_id](#output\_volume\_id) | Unique ID of the volume. |
| <a name="output_volume_labels"></a> [volume\_labels](#output\_volume\_labels) | User-defined labels (key-value pairs). |
| <a name="output_volume_linux_device"></a> [volume\_linux\_device](#output\_volume\_linux\_device) | Device path on the file system for the Volume. |
| <a name="output_volume_location"></a> [volume\_location](#output\_volume\_location) | The location name of the volume to create, not allowed if `server_id` argument is passed. |
| <a name="output_volume_name"></a> [volume\_name](#output\_volume\_name) | Name of the Volume to be created. |
| <a name="output_volume_server_id"></a> [volume\_server\_id](#output\_volume\_server\_id) | Server to attach the Volume to, not allowed if location argument is passed. |
| <a name="output_volume_size"></a> [volume\_size](#output\_volume\_size) | Size of the Volume to be created in GB. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
