resource "aws_route53_zone" "r53_private_zone" {
  name         = "terraform-ecs-r53zone"
}

resource "aws_route53_record" "dns" {
  zone_id = "${aws_route53_zone.r53_private_zone.zone_id}"
  name    = "terraform-ecs-dns"
  type    = "A"

  alias {
    evaluate_target_health = false
    name                   = "${aws_lb.loadbalancer.dns_name}"
    zone_id                = "${aws_lb.loadbalancer.zone_id}"
  }
}