### providers

provider "dnsimple" {}

### resources

resource "dnsimple_record" "this" {
  domain = "${var.domain_name}"
  name   = "${replace(var.name, "-prod", "")}"
  value  = "${heroku_domain.b17g.cname}"
  type   = "CNAME"
  ttl    = 600
}

### outputs

output "dnsimple" {
  value = "${dnsimple_record.this.hostname}"
}
