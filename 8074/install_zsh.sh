#!/bin/bash
export HOME=/home/vagrant
sudo chsh -s /bin/zsh vagrant
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sed -i 's/^ZSH_THEME=.*$/ZSH_THEME="dieter"/g' /home/vagrant/.zshrc

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

append_when_not_found 'alias ack="ack-grep"'        /home/vagrant/.zshrc
append_when_not_found 'export LC_ALL="C.UTF-8"' /home/vagrant/.zshrc
append_when_not_found 'eval $(thefuck --alias)'     /home/vagrant/.zshrc
