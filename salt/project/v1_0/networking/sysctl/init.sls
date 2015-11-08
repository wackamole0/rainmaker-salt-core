/etc/sysctl.conf:
  file.managed:
    - source: salt://rainmaker/core/project/v1_0/networking/sysctl/files/sysctl.conf
    - user: root
    - group: root
    - mode: 644

reload sysctl:
  cmd.run:
    - name: sysctl -p
