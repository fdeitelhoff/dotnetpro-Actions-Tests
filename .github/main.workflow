workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Slack"]
}

action "Create an issue" {
  uses = "JasonEtco/create-an-issue@3b32e1e16d13ce431cc2ad4031eda7ba1396096a"
  secrets = ["GITHUB_TOKEN", "DNP_TEST_SECRET"]
  env = {
    DNP_TEST_ENV = "Ein weiterer Test für die dotnetpro."
  }
}

action "GitHub Action for Slack" {
  uses = "Ilshidur/action-slack@e820f544affdbb77c1dee6d3f752f7f2daf4a0b3"
  needs = ["Create an issue"]
  secrets = ["SLACK_WEBHOOK", "GITHUB_TOKEN"]
}

workflow "New workflow 1" {
  resolves = ["Docker Registry"]
  on = "fork"
}

action "Docker Registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
}
