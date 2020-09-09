#!/bin/bash

# Program:
#     deploy jenkins
# Version:
#     1.0.1
# History:
#     Created on 2018/08/15
#     Last modified on 2018/08/16

# 容器名称
CONTAINER="jenkins_demo"
#!/bin/bash

# 镜像名称（以日期时间为镜像标签，防止重复）
IMAGE=$CONTAINER":"$(date "+%Y%m%d_%H%M%S")
# -d datestr : 显示 datestr 中所设定的时间 (非系统时间)

# 删除滚动更新残留的容器
echo -e "\n删除滚动更新残留的容器"
if docker ps -a | grep -w $CONTAINER"_"$CONTAINER | awk '{print $1}'; then
	name=`docker ps -a | grep -w $CONTAINER"_"$CONTAINER | awk '{print $1}'`
	docker stop $name
	docker rm $name
	echo "删除容器完毕！"
fi
# -w 或 --word-regexp : 只显示全字符合的列。

# 强制删除滚动更新残留的镜像
echo -e "\n强制删除滚动更新残留的镜像"
if docker images | grep -w $CONTAINER | awk '{print $3}'; then
	name=`docker images | grep -w $CONTAINER | awk '{print $3}'`
	docker rmi -f $name
	echo "强制删除镜像完毕!"
fi

# 创建新镜像
echo -e "\ndocker building"
# docker build -t $IMAGE . && \
# --tag, -t: 镜像的名字及标签，通常 name:tag 或者 name 格式；可以在一次构建中为一个镜像设置多个标签。

# 删除 docker-compose.jenkins.yml 文件，防止使用相同镜像
# rm -rf docker-compose.jenkins.yml && \

# 复制 docker-compose.src.yml 文件，防止污染原文件
# cp docker-compose.src.yml docker-compose.jenkins.yml && \

# 替换镜像名标志位为最新镜像
# sed -i s/IMAGE_LATEST/$IMAGE/g docker-compose.jenkins.yml && \

# 使用 docker stack 启动服务
# docker stack deploy -c docker-compose.jenkins.yml $CONTAINER
