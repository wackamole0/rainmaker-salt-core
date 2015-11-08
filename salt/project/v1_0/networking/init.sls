/etc/network/interfaces:
  file.managed:
    - source: salt://rainmaker/core/project/v1_0/networking/files/interfaces
    - user: root
    - group: root
    - mode: 644

/etc/network/interfaces.d/eth0.cfg:
  file.managed:
    - source: salt://rainmaker/core/project/v1_0/networking/files/eth0.cfg
    - user: root
    - group: root
    - mode: 644

/etc/network/interfaces.d/br0.cfg:
  file.managed:
    - source: salt://rainmaker/core/project/v1_0/networking/files/br0.cfg
    - user: root
    - group: root
    - mode: 644

add br0:
  cmd.run:
    - name: ip link add br0 type bridge
    - onlyif: 'test "$(ip link show br0 2>&1)" == "Device \"br0\" does not exist."'

stop br0:
  cmd.run:
    - name: ifdown br0

stop eth0:
  cmd.run:
    - name: ifdown eth0

start br0:
  cmd.run:
    - name: ifup br0

/etc/iptables/rules.v4:
  file.managed:
    - source: salt://rainmaker/core/project/v1_0/networking/files/iptables-rules.v4
    - user: root
    - group: root
    - mode: 644

restore iptables rules:
  cmd.run:
    - name: iptables-restore < /etc/iptables/rules.v4

#/etc/hostname:
#  file.managed:
#    - content: rainmaker.localdev

#set hostname:
#  cmd.run:
#    - name: hostname rainmaker.localdev

#/etc/hosts:
#  file.managed:
#    - source: salt://rainmaker/core/root/v1_0/networking/files/hosts.conf
#    - user: root
#    - group: root
#    - mode: 644
#    - replace: False
