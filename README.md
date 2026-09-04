# voltage!os

Minimal Fedora 44-based KDE Plasma operating system configuration for codename
`lagtrain`, with Vivaldi Browser and Thunderbird.

## First boot

The Kickstart installs a minimal KDE Plasma desktop with Vivaldi Browser
included in the installer package transaction, then
uses firstboot and KDE's `plasma-welcome` first-run experiences after the
initial setup account is created.

The image targets Fedora `x86_64` and `aarch64` systems. The Vivaldi repository
uses the matching RPM architecture path.
Thunderbird is pre-bundled, while KDE's KMail and Kontact mail applications
are excluded.

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

`anaconda.css` is the source stylesheet for a voltage!os-themed Anaconda
installer. It must be included through the installer image or Anaconda theme
integration to be loaded at install time.

See [KIWI-NG.md](KIWI-NG.md) for Kiwi-NG installation and image-build
instructions. Kiwi-NG uses an XML description; `fedora-minimal.ks` remains the
Anaconda Kickstart path. GitHub Actions builds with Fedora 44; Debian or Ubuntu
can be used for local Kiwi-NG builds when the `kiwi-ng` package is available.