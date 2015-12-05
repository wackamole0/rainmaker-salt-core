#
# general
#

guest_ip_addr: 10.100.0.1
root_vm_ip_addr: 10.100.0.254
root_vm_hostname: rainmaker.localdev
services_container_ip_addr: 10.100.0.2
services_container_dns_nameserver: 127.0.0.1
services_container_hostname: services.rainmaker.localdev
services_container_hostname_short: services

#
# dhcpd
#

dhcpd_subnet: 10.100.0.0
dhcpd_netmask: 255.255.0.0
dhcpd_routers: 10.100.0.254
dhcpd_dns_nameservers: 10.100.0.2
dhcpd_example_pool_start_range: 10.100.1.1
dhcpd_example_pool_end_range: 10.100.1.254

#
# bind9
#

bind9_network: 10.100.0.0/16
bind9_listen_address: 10.100.0.2
bind9_rainmaker_forward_zone: rainmaker.localdev
bind9_rainmaker_forward_zone_filename: db.rainmaker.localdev
bind9_rainmaker_reverse_zone: 0.100.10.in-addr.arpa
bind9_rainmaker_reverse_zone_filename: db.10.100.0
bind9_rainmaker_host_ip_prefix: 10.100.0
