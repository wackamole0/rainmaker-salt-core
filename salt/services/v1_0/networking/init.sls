/etc/network/interfaces:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}files/interfaces
    - user: root
    - group: root
    - mode: 644

/etc/network/interfaces.d/eth0.cfg:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/eth0.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644

restart eth0:
  cmd.run:
    - name: "ifdown eth0; sleep 5; ifup eth0; sleep 5"

/etc/hostname:
  file.managed:
    - content: {{ salt['pillar.get']('services_container_hostname', 'services.rainmaker.localdev') }}

set hostname:
  cmd.run:
    - name: hostname {{ salt['pillar.get']('services_container_hostname', 'services.rainmaker.localdev') }}

/etc/hosts:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/hosts.conf
    - user: root
    - group: root
    - mode: 644
    - replace: False
