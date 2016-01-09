#!/usr/bin/env php
<?php

$fstab = file_get_contents('/etc/fstab');

if (stripos($fstab, '# Rainmaker - Start #') > 0) {
    exit;
}

$fstab .= <<<STR



# Rainmaker - Start #

# Root LXC Mount #
/dev/mapper/lxc--vg-root--lxc /var/lib/lxc btrfs rw 0 3
/srv/saltstack /var/lib/lxc/services/rootfs/srv/saltstack none rw,bind 0 0

# Rainmaker - End #
STR;

file_put_contents('/etc/fstab', $fstab);
