################################################
# Volume
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume
################################################

variable "create_volume" {
  description = "A boolean to check whether to create a Volume or not."
  type        = bool
  default     = false
}

variable "volume_name" {
  description = "Name of the Volume to be created."
  type        = string
  default     = ""
}

variable "volume_server_id" {
  description = "Server to attach the Volume to, not allowed if location argument is passed."
  type        = number
  default     = null
}

variable "volume_location" {
  description = "The location name of the volume to create, not allowed if `server_id` argument is passed."
  type        = string
  default     = null

  validation {
    condition     = can(regex("[a-z]{3}[0-9]*", var.volume_location)) || var.volume_location == null
    error_message = "Must have a vaild datacenter name."
  }
}

variable "volume_size" {
  description = "Size of the Volume to be created in GB."
  type        = number
  default     = 10

  validation {
    condition     = contains(range(10, 1000), var.volume_size) # using the Arithmetic operator just didn't work, that's why `contains` and `range` functions are used here
    error_message = "The volume size should be between 10 and 1000 GB. You could increase the 1000 GB limit by contacting the support."
  }
}

variable "volume_automount" {
  description = "Automount the volume upon attaching it (server_id must be provided)."
  type        = bool
  default     = true
}

variable "volume_format" {
  description = "Format volume after creation. `xfs` or `ext4`"
  type        = string
  default     = "xfs"

  validation {
    condition     = contains(["xfs", "ext4"], var.volume_format)
    error_message = "The volume format is not supported. Try `xfs` or `ext4`."
  }
}

variable "volume_delete_protection" {
  description = "Enable or disable delete protection."
  type        = bool
  default     = false
}


################################################
# Volume Attachment
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume_attachment
################################################

variable "create_volume_attachment" {
  description = "A boolean to check whether to create a Volume Attachment or not."
  type        = bool
  default     = false
}

variable "volume_attachment_volume_id" {
  description = "ID of the Volume."
  type        = number
  default     = null
}

variable "volume_attachment_server_id" {
  description = "Server to attach the Volume to."
  type        = number
  default     = null
}

variable "volume_attachment_automount" {
  description = "Automount the volume upon attaching it."
  type        = bool
  default     = false
}
