apt-get update:
  cmd:
    - run

debconf-utils:
  pkg.installed

iptables-persistent-debconf:
  debconf.set:
    - name: iptables-persistent
    - data:
        'iptables-persistent/autosave_v4': {'type': 'boolean', 'value': 'true'}
        'iptables-persistent/autosave_v6': {'type': 'boolean', 'value': 'true'}

ntop-debconf:
  debconf.set:
    - name: ntp
    - data:
        'ntop/interfaces': {'type': 'string', 'value': 'none'}
        'ntop/admin_password': {'type': 'password', 'value': 'admin'}
        'ntop/admin_password_again': {'type': 'password', 'value': 'admin'}

core-tools:
  pkg.installed:
    - pkgs:
      - apache2-dev
      - bridge-utils
      - btrfs-tools
      - curl
      - dnsutils
      - fuse
      - jwhois
      - git
      - htop
      - iftop
      - iotop
      - iptables
      - iptables-persistent
      - iptraf
      - lftp
      - lsof
      - lsyncd
      - man
      - mtr
      - mytop
      - nano
      - nmap
      - ntop
      - openssh-client
      - openssh-server
      - pv
      - rssh
      - rsync
      - siege
      - sshfs
      - sysstat
      - tcpdump
      - telnet
      - traceroute
      - unzip
      - wget
      - zip
