resource "lab" "main" {
  title       = "lovro-4250-gcp-iam-bindings"
  description = "Repro for Unthread #4250: GCP project with 3 principals x 3 distinct roles (9 IAM bindings)."

  layout = resource.layout.single_panel

  settings {
    idle {
      enabled = true
      timeout = "30m"
    }
    timelimit {
      duration = "30m"
    }
  }

  content {
    chapter "repro" {
      title = "Repro"

      page "intro" {
        reference = resource.page.intro
      }
    }
  }
}
