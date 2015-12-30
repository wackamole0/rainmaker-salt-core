rainmaker-group:
  group.present:
    - name: rainmaker
    - gid: 1002
    - system: False

rainmaker-user:
  user.present:
    - name: rainmaker
    - shell: /bin/bash
    - home: /home/rainmaker
    - createhome: True
    - uid: 1002
    - gid: 1002
    - groups:
      - rainmaker
    - password: '$6$n1P/KnGE$MwndzwLiUnxCb3kn71GueAzR1un2XDKOCfQ476lQCcJruTO3lcpfopjtuFozdlNuv2eLihbc5mc5SEl9hHZM81'
    - enforce_password: False

/home/rainmaker/.ssh:
  file.directory:
    - user: rainmaker
    - group: rainmaker
    - mode: 700
    - makedirs: True

/home/rainmaker/.ssh/authorized_keys:
  file.managed:
    - source: salt://rainmaker/core/root/v1_0/rainmaker_user/files/rainmaker_authorized_keys
    - user: rainmaker
    - group: rainmaker
    - mode: 600
    - replace: False

/etc/sudoers.d/rainmaker:
  file.managed:
    - source: salt://rainmaker/core/root/v1_0/rainmaker_user/files/rainmaker_sudoers
    - user: root
    - group: root
    - mode: 400
    - replace: True
