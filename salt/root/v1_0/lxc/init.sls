/etc/init/lxc-net.override:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents: manual

lxc-package:
  pkg.installed:
    - pkgs:
      - lxc

/etc/lxc/default.conf:
  file.managed:
    - source: salt://rainmaker/core/root/v1_0/lxc/files/default.conf
    - user: root
    - group: root
    - mode: 644
