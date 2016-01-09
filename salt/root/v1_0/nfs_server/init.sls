nfs-kernel-server-package:
  pkg.installed:
    - pkgs:
      - nfs-kernel-server

/export/rainmaker:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/etc/exports:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/nfs_exports
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - replace: True

nfs-kernel-server:
  service.running:
    - enable: True
    - reload: True
