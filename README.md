# Example Terraform module

Terraform module which is an example.


## Usage
```hcl
module "addresses" {
  source      = "github.com/sncs-uk/terraform-phpipam-address"

  subnet_v4                   = "10.20.30.0/24"
  subnet_v6                   = "2001:db8::/125"

  address_count               = 2
  address_description         = ["Host 1", "Host 2"]
  address_hostname            = ["host1.example.com", "host2.example.com"]

  address_default_description = "Created by Terraform"
}
```

## Requirements
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_phpipam"></a> [phpipam](#provider\_phpipam) | >= 1.5.2 |
