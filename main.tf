data "oci_ocvp_datastore_clusters" "ocvp_datastore_clusters_lookup" {
  for_each = var.ocvp_datastore_clusters_lookup

  compartment_id       = each.value.compartment_id
  cluster_id           = each.value.cluster_id
  datastore_cluster_id = each.value.datastore_cluster_id
  display_name         = each.value.display_name
  state                = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

