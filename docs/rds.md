## Resources

| Name | Type |
|------|------|
| [aws_db_instance.rds-sqlserver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.private_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_security_group.rds-sqlserver-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | DB engine | `string` | n/a | yes |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | DB engine version | `string` | n/a | yes |
| <a name="input_db_instance"></a> [db\_instance](#input\_db\_instance) | Tipo da instancia pro SQL Server | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Password padrao | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Username padrao | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Subnets privadas | `list(string)` | n/a | yes |
| <a name="input_projeto"></a> [projeto](#input\_projeto) | Nome do projeto | `string` | n/a | yes |
| <a name="input_vpcid"></a> [vpcid](#input\_vpcid) | ID da VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds-endpoint"></a> [rds-endpoint](#output\_rds-endpoint) | Endpoint para conexao no SQL Server |
