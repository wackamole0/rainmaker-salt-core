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
    - source: salt://{{ sls|replace(".", "/") }}/files/default.conf
    - user: root
    - group: root
    - mode: 644

/var/cache/lxc/rainmaker:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/var/cache/lxc/rainmaker/project:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/var/cache/lxc/rainmaker/branch:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
