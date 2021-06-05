# The full list of Linode images is available from 
#     curl -s https://api.linode.com/v4/images | jq ".data[]|.id" | sed -e 's/"//g'
# 
# The full list of regions is available from
#     curl -s https://api.linode.com/v4/regions |jq ".data[]|.id" | sed -e 's/"//g'
# 
# The full list of types is available from
#     curl -s https://api.linode.com/v4/linode/types | jq ".data[] | .id" | sed -e 's/"//g'
# 
# Inputs:
# 
#   - password - string - root password used to create the instance
#   - ssh\_key - string - description = "The ssh public key used in instance's authorized_hosts
#   - image - string - Linode Image type to use
#   - script - string - Linode stackscript.id to execute after Linode is running
#   - region - string - The Linode region to use
#   - type - string - The image size type to use
#   - label - string - The label used to create the instance and hostname
#   - domain - string - pre-existing Linode-managed DNS domain to assign public IP of created instance
# 
#  Outputs:
# 
#   - id - string - linode\_instance.this.id
#   - ip\_address - string - linode\_instance.this.ip\_address
#   - private\_ip\_address - string - linode\_instance.this.private\_ip\_address`
#   - ipv6 - string - linode\_instance.this.ipv6
#   - ipv4 - string - linode\_instance.this.ipv4
#   - backups - string - linode\_instance.this.backups
#
resource "linode_instance" "this" {
  label            = local.instance_label
  image            = var.image
  region           = var.region
  type             = var.type
  authorized_keys  = [ chomp(var.ssh_key) ]
  root_pass        = var.password
  tags             = [
    var.label,
    local.os_tag,
    "Terraform"
  ]
  watchdog_enabled = true
  stackscript_id   = var.script
  stackscript_data = {
    "HOSTNAME"  = var.label
    "DOMAIN"    = var.domain
  }
}
# outputs:
#  id
#  status
#  ip_address
#  private_ip_address
#  ipv6
#  ipv4
#  specs.0.disk
#  specs.0.memory
#  specs.0.vcpus
#  specs.0.transfer
#  backups (enabled, schedule, day, window)

# domain already created and won't be managed
data "linode_domain" "my_domain" {
  domain    = var.domain
}
# output
#  id - The unique ID of this Domain.
#  domain - The domain this Domain represents. These must be unique in our system; you cannot have two Domains representing the same domain
#  type - If this Domain represents the authoritative source of information for the domain it describes, or if it is a read-only copy of a master (also called a slave)
#  group - The group this Domain belongs to.
#  status - Used to control whether this Domain is currently being rendered.
#  description - A description for this Domain.
#  master_ips - The IP addresses representing the master DNS for this Domain.
#  axfr_ips - The list of IPs that may perform a zone transfer for this Domain.
#  ttl_sec - 'Time to Live'-the amount of time in seconds that this Domain's records may be cached by resolvers or other domain servers.
#  retry_sec - The interval, in seconds, at which a failed refresh should be retried.
#  expire_sec - The amount of time in seconds that may pass before this Domain is no longer authoritative.
#  refresh_sec - The amount of time in seconds before this Domain should be refreshed.
#  soa_email - Start of Authority email address.
#  tags - An array of tags applied to this object.

resource "linode_domain_record" "my_dns_entry" {
  domain_id   = data.linode_domain.my_domain.id
  name        = var.label
  record_type = "A"
  target      = linode_instance.this.ip_address
}
