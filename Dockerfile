FROM nginx:1.15.2
# FROM：定制的镜像都是基于 FROM 的镜像，这里的 nginx 就是定制需要的基础镜像。后续的操作都是基于 nginx。

ENV REFRESHED_AT 2018-08-09

# ENV：设置环境变量，定义了环境变量，那么在后续的指令中，就可以使用这个环境变量。

# 格式：
	# ENV <key> <value>
	# ENV <key1>=<value1> <key2>=<value2>...


COPY ./index.html /usr/share/nginx/html/index.html

# COPY : 复制指令，从上下文目录中复制文件或者目录到容器里指定路径。

# 格式：
	# COPY [--chown=<user>:<group>] <源路径1>...  <目标路径>
	# COPY [--chown=<user>:<group>] ["<源路径1>",...  "<目标路径>"]

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \ 
	ln -sf /dev/stderr /var/log/nginx/error.log		#-f 强行删除任何已存在的目标文件


# RUN：用于执行后面跟着的命令行命令。有以下俩种格式：

# shell 格式：
	# RUN <命令行命令>
	# <命令行命令> 等同于，在终端操作的 shell 命令。

# exec 格式：
	# RUN ["可执行文件", "参数1", "参数2"]
	# 例如：
	# RUN ["./test.php", "dev", "offline"] 等价于 RUN ./test.php dev offline


EXPOSE 80

# EXPOSE：仅仅只是声明端口。

# 作用：
	# 帮助镜像使用者理解这个镜像服务的守护端口，以方便配置映射。
	# 在运行时使用随机端口映射时，也就是 docker run -P 时，会自动随机映射 EXPOSE 的端口。

# 格式：
	# EXPOSE <端口1> [<端口2>...]

STOPSIGNAL SIGTERM

# STOPSIGNAL允许您覆盖发送到容器的默认信号.将它从Dockerfile中删除不会造成任何伤害 – 它仍然是SIGTERM的默认值.


CMD ["nginx", "-g", "daemon off;"]

# CMD：类似于 RUN 指令，用于运行程序，但二者运行的时间点不同:
	# CMD 在docker run 时运行。
	# RUN 是在 docker build。

# 作用：为启动的容器指定默认要运行的程序，程序运行结束，容器也就结束。CMD 指令指定的程序可被 docker run 命令行参数中指定要运行的程序所覆盖。
# 注意：如果 Dockerfile 中如果存在多个 CMD 指令，仅最后一个生效。

# 格式：
	# CMD <shell 命令> 
	# CMD ["<可执行文件或命令>","<param1>","<param2>",...] 
	# CMD ["<param1>","<param2>",...]  # 该写法是为 ENTRYPOINT 指令指定的程序提供默认参数