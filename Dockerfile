# 基础镜像（alpine linux)
FROM node:8-alpine3.10
LABEL author=dxq1994@gmail.com
ENV OS_VER=3.10
ENV TIMEZONE=Asia/Shanghai

# 一些工作目录准备
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    # 更新索引，系统和修改时区以及一些扩展
    apk update && apk upgrade -a && apk add --no-cache tzdata bash git openssh && \
    echo "alias ll='ls -l --color=tty'" >> /etc/profile && \
    echo "source /etc/profile " >> ~/.bashrc && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && apk del tzdata && \
    npm config set registry https://registry.npm.taobao.org && npm i cnpm -g

CMD ["bash"]
