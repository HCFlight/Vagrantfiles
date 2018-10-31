## Vagrant 安装

* 安装 Vagrant, 请在这里[下载安装](https://www.vagrantup.com/downloads.html)

* 安装 VirtualBox, 请在这里[下载安装](https://www.virtualbox.org/wiki/Downloads)

* vagrant 详细文档请在这里[查看](https://www.vagrantup.com/docs/index.html)
* 安装 disksize 插件

 ```bash 
 vagrant plugin install vagrant-disksize
 ```
 **注意** 虚拟机存储空间默认设置为 30GB, 可以在 vagrantfile 中设置
 
## 创建虚拟机

clone 当前项目，在有 Vagrantfile 的目录下，执行:

```
git clone https://github.com/HCFlight/Vagrantfiles.git

cd Vagrantfiles/8074

vagrant up
```

* 关闭虚拟机

```
cd Vagrantfiles/8074

vagrant halt
```

* 进入虚拟机

```
cd Vagrantfiles/8074

vagrant ssh 
```

## 共享文件夹
`Vagrantfiles/share`是虚拟机与主机的共用文件目录。例如：将文件移动到 `Vagrantfiles/share` 目录，在虚拟机中的 `/home/vagrant/workspace` 目录下可以访问。



