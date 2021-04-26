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
| linode | 1.16.0 |
| local  | 2.0.0  |
| random | 3.0.0  |
| tls    | 3.0.0  |

## Providers

|  Name  | Version|
|--------|--------|
| linode | 1.16.0 |
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

The Linode list is available from 

    curl -s https://api.linode.com/v4/images | jq ".data[]|.id" | sed -e 's/"//g'

The full list of regions is available from

    curl -s https://api.linode.com/v4/regions |jq ".data[]|.id" | sed -e 's/"//g'

The full list of types is available from

    curl -s https://api.linode.com/v4/linode/types | jq ".data[] | .id" | sed -e 's/"//g'

## Outputs

|    Name    | Description                |
|------------|----------------------------|
| id         | new Linode id              |
| password   | generated root password    |
| ssh        | generated ssh private key  |
| ip_address | assigned public IP address |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Example Code


```
resource "linode_instance" "example" {
  image           = "linode/centos8"
  region          = "us-east"
  type            = "g6.standard-1"
  label           = "foobar"
}

will create a standard linode 
```

## Tests

This module is to serve as sample data for Checkov SAST rules

### Contributors

https://github.com/jameswoolfenden
