# 或 docker build 镜像，自定义版本

自行选择下载版本：https://github.com/alibaba/canal/releases

拷贝canal.adapter-*.tar.gz文件到根目录canal-adapter下

运行docker build -t canal-adapter:1.1.7 .

# 或 docker pull 镜像，版本为1.1.7
docker pull registry.cn-hangzhou.aliyuncs.com/duyuan/canal-adapter:1.1.7