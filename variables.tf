variable "core_compute_host_groups" {
  description = <<EOT
Map of core_compute_host_groups, attributes below
Required:
    - availability_domain
    - compartment_id
    - display_name
    - is_targeted_placement_required
Optional:
    - defined_tags
    - freeform_tags
    - configurations (block):
        - firmware_bundle_id (optional)
        - quick_recycle_settings (optional, block):
            - nvme_wipe (optional)
        - recycle_level (optional)
        - state (optional)
        - target (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    availability_domain            = string
    compartment_id                 = string
    display_name                   = string
    is_targeted_placement_required = bool
    defined_tags                   = optional(map(string))
    freeform_tags                  = optional(map(string))
    configurations = optional(list(object({
      firmware_bundle_id = optional(string)
      quick_recycle_settings = optional(object({
        nvme_wipe = optional(bool)
      }))
      recycle_level = optional(string)
      state         = optional(string)
      target        = optional(string)
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

