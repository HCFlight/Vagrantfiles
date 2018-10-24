## 简介

使用 Vagrantfile 快速的搭建好开发环境开发飞控或者其他项目的环境

## 如何使用 ？
* 安装 Vagrant, 请在这里下载安装 https://www.vagrantup.com/downloads.html
* 安装 VirtualBox, 请在这里下载安装 https://www.virtualbox.org/wiki/Downloads
* 安装 disksize 插件

 ```bash 
 vagrant plugin install vagrant-disksize
 ```
默认大小 30G, 在 vagrantfile 中指定大小

* Clone 当前项目，在有 Vagrantfile 的目录下，执行:

```
git clone https://github.com/YuanfuC/Vagrantfiles.git

cd Vagrantfiles/8074

vagrant up
```

## 进入虚拟机

```
cd Vagrantfiles/8074

vagrant ssh 
```

## 关闭虚拟机

```
cd Vagrantfiles/8074

vagrant halt
```

## Vagrantfiles/share 文件夹
虚拟机与主机的共用文件主，将文件移动到 `Vagrantfiles/share` 目录，可以在虚拟机中的 `/home/vagrant/workspace` 中发现

