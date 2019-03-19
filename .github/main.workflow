workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Slack"]
}

action "Create an issue" {
  uses = "JasonEtco/create-an-issue@3b32e1e16d13ce431cc2ad4031eda7ba1396096a"
}

action "GitHub Action for Slack" {
  uses = "Ilshidur/action-slack@e820f544affdbb77c1dee6d3f752f7f2daf4a0b3"
  needs = ["Create an issue"]
}
