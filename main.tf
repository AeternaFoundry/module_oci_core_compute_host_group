resource "oci_core_compute_host_group" "core_compute_host_groups" {
  for_each = var.core_compute_host_groups

  availability_domain            = each.value.availability_domain
  compartment_id                 = each.value.compartment_id
  display_name                   = each.value.display_name
  is_targeted_placement_required = each.value.is_targeted_placement_required
  defined_tags                   = each.value.defined_tags
  freeform_tags                  = each.value.freeform_tags

  dynamic "configurations" {
    for_each = each.value.configurations != null ? each.value.configurations : []
    content {
      firmware_bundle_id = configurations.value.firmware_bundle_id
      dynamic "quick_recycle_settings" {
        for_each = configurations.value.quick_recycle_settings != null ? [configurations.value.quick_recycle_settings] : []
        content {
          nvme_wipe = quick_recycle_settings.value.nvme_wipe
        }
      }
      recycle_level = configurations.value.recycle_level
      state         = configurations.value.state
      target        = configurations.value.target
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

