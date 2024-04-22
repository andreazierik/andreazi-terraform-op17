## Resources

| Name | Type |
|------|------|
| [aws_launch_template.lt-config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.lt-security-group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.lt-security-group_egress_traffic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_ami.app-projeto17](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Tipo de instancia pro lauch template | `string` | n/a | yes |
| <a name="input_key-pair"></a> [key-pair](#input\_key-pair) | Key Pair para conexao | `string` | n/a | yes |
| <a name="input_projeto"></a> [projeto](#input\_projeto) | Nome do projeto | `string` | n/a | yes |
| <a name="input_vpcid"></a> [vpcid](#input\_vpcid) | ID da VPC | `string` | n/a | yes |

## Outputs

No outputs.
