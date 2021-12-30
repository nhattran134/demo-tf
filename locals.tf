common_tags = merge(
    var.tags, {
      "Project" = var.project
  })