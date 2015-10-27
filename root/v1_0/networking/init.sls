/etc/network/interfaces:
  file.managed:
    - source: salt://rainmaker/core/root/v1_0/networking/files/interfaces
    - user: root
    - group: root
    - mode: 644

/etc/network/interfaces.d/eth0.cfg:
  file.managed:
    - source: salt://rainmaker/core/root/v1_0/networking/files/eth0.cfg
    - user: root
    - group: root
    - mode: 644

/etc/network/interfaces.d/eth1.cfg:
  file.managed:
    - source: salt://rainmaker/core/root/v1_0/networking/files/eth1.cfg
    - user: root
    - group: root
    - mode: 644

/etc/network/interfaces.d/br0.cfg:
  file.managed:
    - source: salt://rainmaker/core/root/v1_0/networking/files/br0.cfg
    - user: root
    - group: root
    - mode: 644

stop br0:
  cmd.run:
    - name: ip link set br0 down

stop eth1:
  cmd.run:
    - name: ip link set eth1 down

start br0:
  cmd.run:
    - name: ip link set br0 up

/etc/iptables/rules.v4:
  file.managed:
    - source: salt://rainmaker/core/root/v1_0/networking/files/iptables-rules.v4
    - user: root
    - group: root
    - mode: 644

restore iptables rules:
  cmd.run:
    - name: iptables-restore < /etc/iptables/rules.v4

/etc/hostname:
  file.managed:
    - content: rainmaker.localdev

set hostname:
  cmd.run:
    - name: hostname rainmaker.localdev

/etc/hosts:
  file.managed:
    - source: salt://rainmaker/core/root/v1_0/networking/files/hosts.conf
    - user: root
    - group: root
    - mode: 644
    - replace: False
