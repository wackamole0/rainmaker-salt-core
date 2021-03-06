/usr/share/lxc/templates:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: False

/usr/share/lxc/templates/lxc-rainmaker-project:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/lxc-rainmaker-project
    - user: root
    - group: root
    - mode: 755

/usr/share/lxc/templates/lxc-rainmaker-project-branch:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/lxc-rainmaker-project-branch
    - user: root
    - group: root
    - mode: 755
