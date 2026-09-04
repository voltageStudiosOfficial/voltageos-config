text
url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch"
repo --name=fedora-updates --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch"

lang en_US.UTF-8
keyboard us
timezone UTC --utc
rootpw --lock
firstboot --enable

network --bootproto=dhcp --device=link --activate
firewall --enabled --service=ssh
selinux --enforcing
services --enabled=NetworkManager,sshd,firewalld
bootloader --location=mbr

zerombr
clearpart --all --initlabel
autopart --type=lvm --nohome

%packages --excludedocs
@core
bash-completion
chrony
curl
dnf5
dolphin
git-core
kde-cli-tools
kde-gtk-config
konsole
kwin
NetworkManager-wifi
openssh-clients
openssh-server
pipewire
plasma-desktop
plasma-nm
plasma-pa
plasma-welcome
plasma-workspace
sddm
sudo
vim-minimal
wireplumber
xorg-x11-server-Xorg
xdg-user-dirs
%end

%post
cat > /etc/yum.repos.d/vivaldi.repo <<'REPO'
[vivaldi]
name=Vivaldi Browser
baseurl=https://repo.vivaldi.com/archive/rpm/x86_64
enabled=1
gpgcheck=1
gpgkey=https://repo.vivaldi.com/archive/linux_signing_key.pub
REPO

dnf5 -y install vivaldi-stable

cat > /etc/voltage-os-release <<'RELEASE'
NAME="voltage!os"
CODENAME=lagtrain
BASE="Fedora"
RELEASE

systemctl set-default graphical.target
systemctl enable sddm.service
systemctl enable chronyd.service
%end