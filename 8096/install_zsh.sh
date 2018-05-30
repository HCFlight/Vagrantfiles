#!/bin/bash
export HOME=/home/vagrant
sudo chsh -s /bin/zsh vagrant
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sed -i 's/^ZSH_THEME=.*$/ZSH_THEME="dieter"/g' /home/vagrant/.zshrc

echo 'alias ack="ack-grep"'             >> /home/vagrant/.zshrc
echo 'export LC_ALL="en_US.UTF-8"'      >> /home/vagrant/.zshrc
