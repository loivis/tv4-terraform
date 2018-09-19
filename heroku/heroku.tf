### providers

provider "heroku" {}

### resources

resource "heroku_app" "this" {
  name = "${var.name}"

  acm        = true
  buildpacks = ["${var.buildpacks}"]
  region     = "${var.region}"
  stack      = "${var.stack}"

  organization = {
    name = "bb-services"
  }
}

resource "heroku_app_feature" "log_runtime_metrics" {
  app  = "${heroku_app.this.name}"
  name = "log-runtime-metrics"
}

resource "heroku_team_collaborator" "deploy" {
  app         = "${heroku_app.this.name}"
  email       = "${var.deployer}"
  permissions = ["view", "deploy"]
}

resource "heroku_domain" "b17g" {
  app      = "${heroku_app.this.name}"
  hostname = "${replace(heroku_app.this.name, "-prod", "")}.${var.domain_name}"
}

### outputs

output "heroku" {
  value = "${heroku_app.this.heroku_hostname}"
}
