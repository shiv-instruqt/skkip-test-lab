resource "lab" "main" {
  title       = "lovro-4250-gcp-iam-bindings"
  description = "This is the Skeleton Lab.\nYou can use this as a minimal starting point for developing labs.\n"

  layout = resource.layout.single_panel

  settings {
    idle {
      enabled = true
      timeout = "30m"
    }
    timelimit {
      duration = "5m"
    }
  }
}
