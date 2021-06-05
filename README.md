# terraform-linode-instance

## Usage

The original module automatically generated your instance root password and SSH key,
but that made it generate different ones over multiple calls.  This version takes
the root password and SSH keys as arguments so that the module can be used to generate
different instances.

Requires your Personal Access Token as an Environmental Variable.

```bash
export LINODE_TOKEN="xxxxx"
```

Include this repository as a module in your existing Terraform code:

```hcl
module "lin_instance" {
  source      = "github.com/mvilain/terraform-linode-instance"
  version.    = "0.0.2"
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

| Name      | Description                                          |   Type   |         Default        | Required |
|-----------|------------------------------------------------------|----------|------------------------|:--------:|
| password  | Linode root password                                 | `string` | none                   |   YES    |
| `ssh_key` | Linode `ssh_key` used to create instance             | `string` | none                   |   YES    |
| image     | Linode Image type to use                             | `string` | `"linode/ubuntu18.04"` |    no    |
| script    | script to execute after Linode is running            | `string` | config/all.sh          |    no    |
| region    | The Linode region to use                             | `string` | `"us-west"`            |    no    |
| type      | The image size type to use                           | `string` | `"g6-nanode-1"`        |    no    |
| label     | label used to define instance and hostname           | `string` | `"example"`            |    no    |
| domain    | Linode DNS domain used to define instance IP         | `string` | `"example.com"`        |    no    |

The Linode list is available from 

    curl -s https://api.linode.com/v4/images | jq ".data[]|.id" | sed -e 's/"//g'

The full list of regions is available from

    curl -s https://api.linode.com/v4/regions |jq ".data[]|.id" | sed -e 's/"//g'

The full list of types is available from

    curl -s https://api.linode.com/v4/linode/types | jq ".data[] | .id" | sed -e 's/"//g'

## Outputs

| Name                    | Description                                            |
|-------------------------|--------------------------------------------------------|
| id                      | new Linode id                                          |
| `ip_address`            | assigned public IP address                             |
| `private_ip_address`    | private IP address, if enabled                         |
| ipv6                    | Linode's IPv6 SLAAC addresses                          |
| ipv4                    | Linode's IPv4 Addresses (need ticket for multiple IPs) |
| backups.enabled         | Linode's backups are enabled                           |
| backups.schedule.day    | schedule day of week when backups are run              |
| backups.schedule.window | UTC window when backups are taken                      |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Example Code

```
resource "linode_instance" "example" {
  image           = "linode/centos8"
  region          = "us-east"
  type            = "g6.standard-1"
  label           = "foobar"
  domain          = "mydomain.com"
  inventory       = "inventory_py3"
}

will create a standard linode with DNS entry foobar.mydomain.com
```

## Tests

This module is to serve as sample data for Checkov SAST rules

### Contributors

https://github.com/jameswoolfenden
