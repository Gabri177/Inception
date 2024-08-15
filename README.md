# Docker for beginner

## 1 Docker 概述

### 1.1 课程引入

* 1.1.1 开发与运维
    * 开发与测试和运维间的矛盾,  主要是由于环境的不同引发的. 如果能将开发人员使用的环境交给测试与运维使用, 将会大大方便项目的推进
* 1.1.2 DevOps
    * 一种思想, 一种管理模式和执行规范, 用于促进开发, 测试与运维部门之间的沟通, 协作与整合
* 1.1.3 运维与架构师
    * 运维希望能一键部署
* 1.1.4 学习中集群搭建的问题
    * 学习过程中, 由于机器配置较低从而导致启动的虚拟机较少, 影响学习效率\

### 1.2 Docker的简介

* 开源的应用容器引擎, 可以让开发者将应用及应用运行的环境打包到一个轻量级, 可移植的镜像中, 然后发布到任何流行的Linux等系统的机器上.
* 使用Go语言开发
* [Docker](http://docker.com)

### 1.3 Docker 的用途

* 1.3.1 提供统一的运行环境
    * 确保在任何宿主机HOST可以得到相同的结果
* 1.3.2 便捷的应用迁移
    * 确保了统一的运行环境, 使得应用的迁移更便捷. 用户可以方便的将一个平台上运行的应用, 迁移到另一个平台.
* 1.3.3 超快的启动时间
    * Dock容器应用直接云星宇宿主机系统, 无需启动操作系统, 因此可以做到秒级, 甚至毫秒级的启动. 传统的虚拟机技术应用一般需要数分钟: 启动虚拟机, 加载虚拟机操作系统, 手工启动应用...
* 1.3.4 更轻松的维护和扩展
    * 有[官方的镜像](hub.docker.com), 可以直接在生产环境中使用, 也可以进一步定制, 大大降低了应用服务镜像的成本.
    * Docker使用分层存储以及镜像技术, 使得应用重复部分的复用率更为容易, 也使得英勇的维护更新更加简单.

### 1.4 容器与虚拟机的区别

* Docker容器的本质就是通过容器虚拟技术虚拟出的一台主机, 就像虚拟机一样, 可以将应用及其运行环境部署在这台虚拟机上运行. 但容器与虚拟机又有着本质的不同
* 1.4.1 普通系统中的程序运行原理
    * 程序是一个对计算机硬件资源调度使用的指令序列.
* 1.4.2 传统虚拟技术 Hypervisr
    * 运行在基础物理服务器和操作系统之间的中间软件层, 可允许多个操作系统和应用共享硬件. 也可以叫做==VMM==.

### 1.5 Windows系统虚拟化

* 现在的Windows系统本质上是运行在==hiper-v==上的虚拟机. 而原来的应用层现在也是运行在==Hiper-v==上的虚拟机.  系统上运行的一个个应用, 其实
* 就是运行在应用层虚拟机中. 

### 1.6 Docker 系统架构

![image-20240714012013983](./assets/image-20240714012013983.png)

* 1.6.1 Docker Deamon
    * 是Docker的守护进程. 监听Docker API请求病管理Docker对象, 例如镜像, 容器, 网络和卷. 守护进程还可以与其他守护进程通信以管理Docker服务.
* 1.6.2 镜像 Image
    * 用于创建Docker容器的模板, 就像面向对象编程中的类
* 1.6.3 容器 Container
    * Docker容器是镜像运行时的实体. 就像面向对象编程中类的实例. 一个镜像可以创建出很多个容器. 每个处于巡行状态的容器中豆瓣喊着一个或多个相关额应用, 且他的运行不会干扰到其他容器. 因为他们之间是相互隔离的.
* 1.6.4 仓库 Repository
    * Docker 镜像仓库用来保存相关的一组镜像, 这组镜像具有相同的镜像名称, 由于镜像仓库名称相同.
* 1.6.5 标签 Tag
    * 通过==<repository>:<tag>==可以唯一定位一个镜像. 即镜像标签其实就是镜像仓库中用于区分各个镜像的一种标识, 同一个仓库中的镜像具有不同的标签
* 1.6.6 镜像中心 Registry
    * Docker 的镜像中心中存放着很至由官方、其他机构或个人创建的 Docker 仓库，Docker 用户可以直接从这些仓库中 pull 霝要的镜像，也可以将自己制作的镜像push 到Docker 镜像中心相应的仓库中。最常用的镜像中心是Docker 官方的 Docker Hub

## 2 Docker 引擎

### 2.1 Docker 引擎架构

* Docker 引擎是用来运行和管理容器的核心软件, 其现代架构由四部分主要组件构成 : ==Docker Client==, ==Dockerd==, ==Containerd==. ==Runc==
* 2.1.1 Docker Client
    * Docker 客户端, Docker引擎提供CLI工具, 用于用户向Docker提交命令请求
* 2.1.2 Dokerd
    * 守护进程, Docker Deamon. 在现代Dockerd中的主要包含的功能有: 镜像构建, 镜像管理, REST API, 核心网络及编排等. 并通过gRPC与Containerd进行通信
* 2.1.3 Containerd
    * Container Deamon, 该项目的主要功能是管理容器的生命周期. 其本身并不会创建容器, 而是调用Runc来完成容器的创建
* 2.1.4 Runc
    * Run Container, 是OCI容器运行时规范的实现, Runc项目的目标之一就是与规范保持一致. 所以Runc所在层也称为OCI层. 这使得Docker Deamon中不用再包含任何容器运行时的代码, 简化了Docker Deamon.
    * Runc只有一个作用 -> 创建容器, 其本质黑丝一个独立的容器运行时CLI工具. 其在fork出一个容器子进程后会启动该容器进程. 在启动完毕后Runc会自动退出.
* 2.1.5 Shim
    * Shim 是实现“Daemonless Container” 不可或缺的工具，使容器与 Docker Daemon 解耩， 使得 Docker Daemon 的维护与升级不会影响到远行中的容器. 
    * 每次创建容器时，Containerd 会先fork 出 Shim 进程，再由 shim 进程fork 出 Runc进程。 当 Runc 自动退出之前，会先将新容器进程的父进程指定为相应的 Shim 进程
    * 除了作为容器的父进程外，Shim 进程还具有两个重要功能：
        *  保持所有 STDIN 与STDOUT 流的开启状态，从而使得当 Docker Daemon 重启时，容器不会因为 Pipe 的关闭而终止。
        * 将容器的退出状态反馈给 Docker Daemon。
    * ![image-20240714015545170](./assets/image-20240714015545170.png)
* 

---

# Command about images

`docker rmi + image_id`  => delete images

`docker rmi -f + image_id1 image_id2` => delete images with force

`docker images` => get images info

`docker rmi -f $(docker images -qa)` => delete all images

`docker pull image_name` => pull certain image

`docker search image_name` => search certain image

`docker system df` => show the detail info of images include image_id, the volumn ocupied by certain images, etc.

==What is **dangling image**?==
		The image with that the name of the repo and the name of it's tag are all <none> was called 'Dangling image'.

# Command about containers

`docker run [ops] IMAGE [cmd] [arg...]` establash and run a container

























