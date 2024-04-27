resource "aws_acm_certificate" "app" {
  domain_name       = "*.${var.domain}"
  validation_method = "DNS"
}

resource "aws_route53_record" "app-validation" {
  for_each = {
    for dvo in aws_acm_certificate.app.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.domain_zone_id
}

resource "aws_acm_certificate_validation" "app" {
  certificate_arn         = aws_acm_certificate.app.arn
  validation_record_fqdns = [for record in aws_route53_record.app-validation : record.fqdn]
}

resource "aws_route53_record" "app" {
  name    = "op17.${var.domain}"
  type    = "A"
  zone_id = "${var.domain_zone_id}"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = false
  }
}