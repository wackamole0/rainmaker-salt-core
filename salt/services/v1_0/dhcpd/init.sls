dhcpd-packages:
  pkg.installed:
    - pkgs:
      - isc-dhcp-server

/etc/dhcp/dhcpd.conf:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/dhcpd/files/dhcpd.conf
    - user: root
    - group: root
    - mode: 644

/etc/dhcp/dhcpd.host.conf:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/dhcpd/files/dhcpd.host.conf
    - user: root
    - group: root
    - mode: 644
    - replace: False

/etc/dhcp/dhcpd.class.conf:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/dhcpd/files/dhcpd.class.conf
    - user: root
    - group: root
    - mode: 644
    - replace: False

/etc/dhcp/dhcpd.subnet.conf:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/dhcpd/files/dhcpd.subnet.conf
    - user: root
    - group: root
    - mode: 644
    - replace: False

/etc/dhcp/dhcpd.host.conf.d:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/etc/dhcp/dhcpd.host.conf.d/localdev.example.cluster.conf:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/dhcpd/files/dhcpd.host.conf.d/localdev.example.cluster.conf
    - user: root
    - group: root
    - mode: 644

/etc/dhcp/dhcpd.host.conf.d/localdev.example.conf:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/dhcpd/files/dhcpd.host.conf.d/localdev.example.conf
    - user: root
    - group: root
    - mode: 644

/etc/dhcp/dhcpd.class.conf.d:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/etc/dhcp/dhcpd.class.conf.d/localdev.example.conf:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/dhcpd/files/dhcpd.class.conf.d/localdev.example.conf
    - user: root
    - group: root
    - mode: 644

/etc/dhcp/dhcpd.subnet.conf.d:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/etc/dhcp/dhcpd.subnet.conf.d/10.100.0.0.conf:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/dhcpd/files/dhcpd.subnet.conf.d/10.100.0.0.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644

isc-dhcp-server:
  service.running: []

set dhcpd service defaults:
  cmd.run:
    - name: update-rc.d isc-dhcp-server defaults
