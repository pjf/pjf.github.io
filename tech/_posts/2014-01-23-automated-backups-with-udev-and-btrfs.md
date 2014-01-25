---
title: Automated backups with udev and btrfs
tags: linux udev sysadmin usb rsync btrfs snapback pebble pushover
description: "I just want my backups to happen whenever I plug in my drive. Also, I want notifications to go to my watch. So I've done just that."
wide_image: /images/tech/backup-starting.jpg
---

I'm incredibly lazy. My preferred way of making backups is to
plug in an external drive, and have my laptop automatically do the
rest.

In order to facilitate this laziness, I'm going to be using
two tools: btrfs (an amazing filesystem with snapshot support),
and udev (which can detect when a device has been inserted or
removed). I'm also going to send notifcations directly to my
Pebble watch, because I can.

<!--more-->

Everything in this guide needs to be done as root, so we might as well
start a root-shell now:

    $ sudo -i

### Preparing our disk

I use [btrfs][btrfs] for external backups. It's able to detect when
data has gone bad, it has wicked-cool snapshot capabilities, and if
I'm backing up an existing btrfs filesystem I can do very quickly and
efficiently  by sending incremental snapshots. However most of this
guide will still work even if you're using a different filesystem
type.

Our first step is to prepare the disk where our backups are going to
live. under Linux we can have volumes with *labels*. They're awesome,
because they're human readable, but still provide a way to identify a
device regardless of where it gets mounted. In theory one could
have a number of drives with the same label, and we could trigger
a backup automatically whenever *any* of them are plugged in.

With btrfs, we can set the label when we format the disk, but I
always forget to do that. It's okay, because changing the label is
easy:

    $ btrfs filesystem label /dev/sdc1 backup

If you're using `ext2` or above, you can do the same with `tune2fs`:

    $ tune2fs -L backup /dev/sdc1

My actual disks have more descriptive labels, indicating both the
machine and filesystem they're responsible for.

I like to mount my backups in a consistent location, so I'm going to
create that now:

    $ mkdir /mnt/backup

We also need to tell linux that when it sees a disk with the `backup`
label, it needs to go on the mount-point specified.  We do this
by adding a line to `/etc/fstab`, and we can also specify other
options in here as well For example, I use btrfs' compression
option:

    $ echo "LABEL=backup /mnt/backup btrfs noauto,compress 0 2" \
        >> /etc/fstab

On other filesystems, you should leave out 'compress' on the line
above. The 'noauto' option tells Linux not to try and mount the
drive when booting; as a removable backup drive, it's unlikely
to be there.

### udev

Now for the bit which caused me pain, `udev`, a system for triggering
events when devices change on your system. I don't know if there
are versions of `udev` with different keywords, or which care
differently about capitalisation, but it took a *lot* of tweaking
around until I managed to get a udev rule that would automatically
mount my disk:

    $ cat > /etc/udev/rules.d/99-backup.rules

    SUBSYSTEM=="block", ENV{ID_FS_LABEL}=="backup", ACTION=="add", \
        RUN+="/bin/mount /mnt/backup"

Udev is also supposed to automatically pick up new rules, but my
system didn't the first time. We can nudge it with:

    $ udevadm control --reload-rules

### Backups

To make backups I'm using rsync. I use both `ionice` and `nice`
to have our command yield both io and cpu resources to other processes,
so we don't lose system responsiveness during the backup.

I also use the `-vHAaxX` switches to `rsync`. This backups
up `v`erbosely, `H`ard links, `A`CLs, `a`ll, `X`tended attributions,
and sticking to one filesystem (`-x`). I also pass in `--delete`
to remove files from the backup drive that are no longer on my
machine's disk.

In addition, I also pass `--filter 'P SNAPSHOT-*`, to tell rsync
to protect any file at the destination which starts with `SNAPSHOT-`.
As we'll see in a moment, these are my btrfs snapshots; we don't
want rsync to try and remove them.

    $ ionice -c3 nice rsync -vHAaxX --delete \
        --filter 'P SNAPSHOT-*' / /mnt/backup/

Once this is done (it can take some time), I take a read-only
btrfs snapshot on my backup drive with the current date in UTC:

    $ btrfs subvolume snapshot -r /mnt/backup \
        /mnt/backup/SNAPSHOT-`date -u +%Y-%m-%d`

One of the joys of btrfs is the top-level filesystem on my backup
drive is arranged exactly the same way as the filesystem I'm backing
up. In a pinch I could use it a a drop-in replacement. If a file
doesn't change between snapshots, then btrfs requires no additional
storage space to store it, and with [bedup][bedup] we can even
de-duplicate files across filesystems and subvolumes.

Each snapshot is also a complete backup in its own right; I
never have to worry about whether I have a base filesystem upon which
to apply an incremental backup on to.

If you're not using btrfs or a similar snapshotting filesystem, you might find
[rsnapshot][rsnapshot] preferable to straight rsync. It makes rolling snapshots
where unchanged files are hard linked to conserve space, but looks like a
complete backup each time.

### Automating everything with snapback

`Snapback` is some code I wrote because anything more than plugging
in a USB drive to my laptop is just too much work. It uses
[Pushover][pushover] to send notifications to my pebble watch, so
there's no need to look through `/var/log` to see what's happening,
and I'm immediately notified when the backup is complete.

It ties all the above together into a script that's triggered
from udev.  Because udev kills any process that's running too long,
under the hood we fork a daemon to do the heavy lifting for us.

`Snapback` is pretty heavily customised to work on my laptop, but
you're welcome to adapt it to your own purposes if you like.

You can [find snapback on github][snapback].

### Credits

Thanks to {% t jeremyvisser Jeremy Visser %} for pointing out `sudo -i` as a
more comfortable way to get a root shell.

Thanks to {% t evmcl Evan %} for reminding me of rsnapshot, and providing
a [content patch](https://github.com/evmcl/pjf.github.io/commit/fa400560eb9aabf14b9d324b462ea58ddba3ddc4)
to this article! :)
