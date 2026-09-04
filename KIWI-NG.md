# Kiwi-NG

The repository includes the Kiwi-NG description in `kiwi/config.xml`.
It builds the Fedora 44-based voltage!os KDE Plasma image with SDDM,
Vivaldi, and Thunderbird.

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

The description targets Fedora 44 x86_64. Test generated images in a virtual
machine before writing them to physical media.

`fedora-minimal.ks` remains the separate Anaconda Kickstart installation path.
