/etc/network/interfaces:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/interfaces
    - user: root
    - group: root
    - mode: 644

/etc/network/interfaces.d/eth0.cfg:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/eth0.cfg
    - user: root
    - group: root
    - mode: 644

restart eth0:
  cmd.run:
    - name: "ifdown eth0; sleep 5; ifup eth0; sleep 5"
