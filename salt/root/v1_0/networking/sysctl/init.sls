/etc/sysctl.conf:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/sysctl.conf
    - user: root
    - group: root
    - mode: 644

reload sysctl:
  cmd.run:
    - name: sysctl -p
