# Kiwi-NG

The repository includes the Kiwi-NG description in `kiwi/config.xml`.
It builds the Fedora 44-based voltage!os KDE Plasma image with SDDM,
Vivaldi, and Thunderbird.

## Build environment

The GitHub Actions image build uses Fedora 44 as its builder for both
`x86_64` and `aarch64`. Fedora is preferred because the image itself is based
on Fedora 44.

For a local Debian or Ubuntu builder, install Kiwi-NG with the distribution
package when available:

```sh
sudo apt update
sudo apt install kiwi-ng
```

The builder distribution does not change the Fedora repositories or target
architecture in `kiwi/config.xml`.

## Install Kiwi-NG

```sh
sudo dnf install kiwi-cli
kiwi-ng --version
```

## Build

Run these commands from the repository root:

```sh
sudo kiwi-ng system prepare \
  --description ./kiwi \
  --target-dir ./build/root

sudo kiwi-ng system build \
  --description ./kiwi \
  --target-dir ./build/image
```

The description targets Fedora 44 `x86_64` and `aarch64`. Test generated images
in a virtual machine before writing them to physical media.

`fedora-minimal.ks` remains the separate Anaconda Kickstart installation path.
