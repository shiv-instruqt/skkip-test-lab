resource "layout" "single_panel" {
  column {
    width = "100%"
    instructions {
      title = "Instructions"
    }
    tab "shell" {
      target = resource.terminal.shell
      title  = "shell"
    }
  }
}
