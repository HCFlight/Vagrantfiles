#!/bin/bash


append_when_not_found() {
    line=$1
    file=$2
    dry_run=$3

    if [ x"$dry_run" = x"true" ]
    then
        (grep -q -F "$line" $file) || ((echo "Append [$line] to [$file]") && (echo "$line"))
    else
        (grep -q -F "$line" $file) || ((echo "Append [$line] to [$file]") && (echo "$line" >> $file))
    fi
}


function change_apt_source_to_aliyun()
{
	cat >> /etc/apt/sources.list << EOF
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
EOF
	sudo apt update
}

#sudo apt update

function install_essentials_packages()
{
	sudo add-architecture i386
	sudo apt install -y vim openssh-server net-tools zsh build-essential ack-grep git android-tools-adb curl libc6:i386 libncurses5:i386 libstdc++6:i386 unzip libtool htop python3-dev python3-pip python-setuptools python-dev python-pip build-ninja tmux
	sudo pip3 install thefuck
}

function install_latest_adb()
{
	wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
	unzip ./platform-tools-latest-linux.zip
	sudo cp platform-toos/adb /usr/bin/adb
	sudo cp platform-tools/fastboot /usr/bin/fastboot
}

function install_oh_my_zsh()
{
	ZSHRC=$HOME/.zshrc
	sudo chsh -s /bin/zsh $USER
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	sed -i 's/^ZSH_THEME=.*$/ZSH_THEME="dieter"/g' ${ZSHRC}

	append_when_not_found 'alias ack="ack-grep"'   ${ZSHRC}
	append_when_not_found 'export LC_ALL="C.UTF-8"' ${ZSHRC}
	append_when_not_found 'eval $(thefuck --alias)'     ${ZSHRC}
	append_when_not_found 'alias kst="kst2 --asciiDataStart 3 --asciiFieldNames 1 --asciiReadUnits 2 --asciiSpaceDelim"'a ${ZSHRC}
}

function install_repo()
{
	wget http://git.zerozero.cn/zz-public/git-repo/raw/master/repo && chmod +x repo && sudo mv repo /usr/bin
}

function install_kst2()
{
	sudo add-apt-repository ppa:kst-plot/ppa
	sudo apt-get update
	sudo apt install -y kst
}

function install_cmake()
{
	wget "https://cmake.org/files/v3.12/cmake-3.12.2-Linux-x86_64.tar.gz"
	tar xzf ./cmake-3.12.2-Linux-x86_64.tar.gz
	sudo cp -rf ./cmake-3.12.2-Linux-x86_64/bin /usr/local/
	sudo cp -rf ./cmake-3.12.2-Linux-x86_64/doc /usr/local/
	sudo cp -rf ./cmake-3.12.2-Linux-x86_64/share /usr/local/
}

install_essentials_packages
install_latest_adb
install_oh_my_zsh
install_repo
install_kst2
install_cmake
