/etc/network/interfaces:
  file.managed:
    - source: salt://rainmaker/core/branch/v1_0/networking/files/interfaces
    - user: root
    - group: root
    - mode: 644

/etc/network/interfaces.d/eth0.cfg:
  file.managed:
    - source: salt://rainmaker/core/branch/v1_0/networking/files/eth0.cfg
    - user: root
    - group: root
    - mode: 644

stop eth0:
  cmd.run:
    - name: ifdown eth0

start eth0:
  cmd.run:
    - name: ifup eth0
