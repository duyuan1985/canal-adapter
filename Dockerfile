FROM canal/osadmin:v3-amd64

MAINTAINER duyuan (170216832@qq.com)

COPY image/ /tmp/docker/
COPY canal.adapter-*.tar.gz /home/admin/

RUN \
    cp -R /tmp/docker/alidata /alidata && \
    chmod +x /alidata/bin/* && \
    mkdir -p /home/admin && \
    mkdir -p /home/admin/bin/ && \
    cp -R /tmp/docker/app_adapter.sh /home/admin/app.sh  && \
    cp -R /tmp/docker/admin/* /home/admin/  && \
    /bin/cp -f alidata/bin/lark-wait /usr/bin/lark-wait && \

    mkdir -p /home/admin/canal-adapter && \
    tar -xzvf /home/admin/canal.adapter-*.tar.gz -C /home/admin/canal-adapter && \
    /bin/rm -f /home/admin/canal.adapter-*.tar.gz && \

    #mkdir -p home/admin/canal-adapter/logs  && \
    chmod +x /home/admin/*.sh  && \
    chmod +x /home/admin/bin/*.sh  && \
    chown admin: -R /home/admin && \
    yum clean all && \
    true

EXPOSE 8081

WORKDIR /home/admin

ENTRYPOINT [ "/alidata/bin/main.sh" ]
CMD [ "/home/admin/app.sh" ]
