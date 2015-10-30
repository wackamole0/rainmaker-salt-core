bind9-packages:
  pkg.installed:
    - pkgs:
      - bind9
      - bind9-doc
      - dnsutils

/etc/bind/named.conf.options:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/bind9/files/named.conf.options
    - template: jinja
    - user: root
    - group: root
    - mode: 644

/etc/bind/named.conf.local:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/bind9/files/named.conf.local
    - user: root
    - group: root
    - mode: 644

/etc/bind/named.conf.rainmaker:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/etc/bind/named.conf.rainmaker/example.conf:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/bind9/files/named.conf.rainmaker/example.conf
    - user: root
    - group: root
    - mode: 644

/etc/bind/named.conf.rainmaker/rainmaker.conf:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/bind9/files/named.conf.rainmaker/rainmaker.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - replace: False

/etc/bind/db.rainmaker:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/etc/bind/db.rainmaker/db.10.100.1.example:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/bind9/files/db.rainmaker/db.10.100.1.example
    - user: root
    - group: root
    - mode: 644

/etc/bind/db.rainmaker/db.example.localdev:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/bind9/files/db.rainmaker/db.example.localdev
    - user: root
    - group: root
    - mode: 644

/etc/bind/db.rainmaker/{{ salt['pillar.get']('bind9_rainmaker_reverse_zone_filename', 'db.10.100.0') }}:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/bind9/files/db.rainmaker/{{ salt['pillar.get']('bind9_rainmaker_reverse_zone_filename', 'db.10.100.0') }}
    - user: root
    - group: root
    - mode: 644

/etc/bind/db.rainmaker/{{ salt['pillar.get']('bind9_rainmaker_forward_zone_filename', 'db.rainmaker.localdev') }}:
  file.managed:
    - source: salt://rainmaker/core/services/v1_0/bind9/files/db.rainmaker/{{ salt['pillar.get']('bind9_rainmaker_forward_zone_filename', 'db.rainmaker.localdev') }}
    - template: jinja
    - user: root
    - group: root
    - mode: 644

bind9:
  service.running: []

set bind9 service defaults:
  cmd.run:
    - name: update-rc.d bind9 defaults

