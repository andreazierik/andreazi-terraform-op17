## Resources

| Name | Type |
|------|------|
| [aws_lb.projeto17-alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.projeto17-tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.alb-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.alb-sg-ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_any-ip"></a> [any-ip](#input\_any-ip) | IP corringa | `list(string)` | n/a | yes |
| <a name="input_bucket-name"></a> [bucket-name](#input\_bucket-name) | Bucket para armazenar os logs | `string` | n/a | yes |
| <a name="input_bucket-prefix"></a> [bucket-prefix](#input\_bucket-prefix) | Pasta para armazenar os logs no bucket | `string` | n/a | yes |
| <a name="input_projeto"></a> [projeto](#input\_projeto) | Nome do projeto | `string` | n/a | yes |
| <a name="input_public-subnets-ids"></a> [public-subnets-ids](#input\_public-subnets-ids) | IDs das subnets publicas para associar ao ALB | `list(string)` | n/a | yes |
| <a name="input_vpcid"></a> [vpcid](#input\_vpcid) | ID da VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb-sg"></a> [alb-sg](#output\_alb-sg) | ID do SG configurado no ALB |
