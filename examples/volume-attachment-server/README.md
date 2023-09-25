# volume-attachment-server

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.42.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sv"></a> [sv](#module\_sv) | zoro16/server/hcloud | 1.0.0 |
| <a name="module_vol"></a> [vol](#module\_vol) | ../.. | n/a |
| <a name="module_vol_attach"></a> [vol\_attach](#module\_vol\_attach) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcloud_token"></a> [hcloud\_token](#input\_hcloud\_token) | Hetzner Cloud API Token | `string` | n/a | yes |

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
