# voltage!os

Minimal Fedora-based KDE Plasma operating system configuration for codename
`lagtrain`, with Vivaldi Browser.

## First boot

The Kickstart installs a minimal KDE Plasma desktop and Vivaldi Browser, then
uses firstboot and KDE's `plasma-welcome` first-run experiences after the
initial setup account is created.

The Vivaldi repository is configured for Fedora x86_64 systems.

## Install

Use `fedora-minimal.ks` with a Fedora installer:

```text
inst.ks=https://example.invalid/fedora-minimal.ks
```

The profile erases all detected disks and uses automatic LVM partitioning.
Test it in a virtual machine before installing on hardware.

`dnf.conf` contains conservative DNF defaults for the installed system.

`os-release` is the editable operating system identity file. Install it as
`/etc/os-release` in the image build to set the name, codename, version, and
project URLs reported by the operating system.