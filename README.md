# terraform-linode-instance

## Usage

Requires your Personal Access Token as an Environmental Variable.

Module automatically generate your instance root password amd SSH key.

```bash
export LINODE_TOKEN="xxxxx"
```

Include this repository as a module in your existing Terraform code:

```hcl
module "lin_instance" {
  source      = "github.com/mvilain/terraform-linode-instance"
  version.    = "0.0.1"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

|  Name  | Version|
|--------|--------|
| local  | 2.0.0  |
| random | 3.0.0  |
| tls    | 3.0.0  |

## Providers

|  Name  | Version|
|--------|--------|
| local  | 2.0.0  |
| random | 3.0.0  |
| tls    | 3.0.0  |

## Inputs

|  Name  |          Description                  |   Type   |         Default        | Required |
|--------|---------------------------------------|----------|------------------------|:--------:|
| image  | Linode Image type to use              | `string` | `"linode/ubuntu18.04"` |    no    |
| region | The Linode region to use              | `string` | `"us-west"`            |    no    |
| type   | The image size type to use            | `string` | `"g6-nanode-1"`        |    no    |
| label  | The label used to define the instance | `string` | `"example"`            |    no    |

## Outputs

|    Name    | Description               |
|------------|---------------------------|
| id         | new Linode id             |
| password   | generated root password   |
| ssh        | generated ssh private key |
| ip_address | assigned public IP addres |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Example Code

```
resource "linode_instance" "example" {
  label           = local.instance_label
  image           = var.image
  region          = var.region
  type            = var.type
  authorized_keys = [chomp(tls_private_key.ssh.public_key_openssh)]
  root_pass       = random_password.password.result
  tags            = [ var.label ]
}
```

## Tests

This module is to serve as sample data for Checkov SAST rules

### Contributors

[jameswoolfenden]: https://github.com/jameswoolfenden
