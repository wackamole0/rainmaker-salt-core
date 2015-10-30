/var/lib/lxc:
  file.directory:
    - user: root
    - group: root
    - mode: 700
    - makedirs: True

/dev/sdb:
  lvm.pv_present

lxc-vg:
  lvm.vg_present:
    - devices: /dev/sdb

root-lxc:
  lvm.lv_present:
    - vgname: lxc-vg
    - extents: 100%FREE

btrfs-tools:
  pkg.installed

lxc_mkfs:
      cmd.run:
        - name: 'mkfs.btrfs /dev/lxc-vg/root-lxc'
        - unless: 'test "$(blkid -s TYPE -o value /dev/lxc-vg/root-lxc)" == "btrfs"'
        - require:
          - lvm: root-lxc

add btrfs to modules:
  file.append:
    - name: /etc/modules
    - text: btrfs

btrfs:
  kmod.present

lxc_mount:
  mount.mounted:
    - name: /var/lib/lxc
    - device: /dev/mapper/lxc--vg-root--lxc
    - fstype: btrfs
    - opts: rw
    - dump: 0
    - pass_num: 3
    - persist: True
    - mkmnt: False
    - require:
      - file: /var/lib/lxc
