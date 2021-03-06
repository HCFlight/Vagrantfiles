>/etc/apt/sources.list

cat >>/etc/apt/sources.list<<EOF
# deb cdrom:[Ubuntu 16.04 LTS _Xenial Xerus_ - Release amd64 (20160420.1)]/ xenial main restricted
deb-src http://archive.ubuntu.com/ubuntu xenial main restricted #Added by software-properties
deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe #Added by software-properties
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe #Added by software-properties
deb http://mirrors.aliyun.com/ubuntu/ xenial universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe
deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse #Added by software-properties
deb http://archive.canonical.com/ubuntu xenial partner
deb-src http://archive.canonical.com/ubuntu xenial partner
deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe #Added by software-properties
deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse
EOF

dpkg --add-architecture i386
apt-get update

apt-get install -y zsh vim build-essential ack-grep git android-tools-adb curl cmake libc6:i386 libncurses5:i386 libstdc++6:i386
apt-get install -y unzip libtool htop python3-dev python3-pip python-setuptools python-dev build-essential python-pip
apt-get install -y docker.io
sudo locale-gen zh_CN.UTF-8
#修改 docker sudo 权限
sudo gpasswd -a vagrant docker
sudo service docker restart

#pip3 install thefuck

mv /tmp/repo /usr/bin/repo && chmod 775 /usr/bin/repo

#cd /home/vagrant && sudo --user=vagrant bash /tmp/install_zsh.sh
