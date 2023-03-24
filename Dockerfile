FROM alpine:latest

ENV TZ=Asia/Shanghai

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk add --update --no-cache jq bash curl tzdata \
  && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone \
  && rm -rf /var/cache/apk/* && rm -rf /tmp/* \
  && wget -O /usr/bin/yq https://github.com/mikefarah/yq/releases/download/v4.30.6/yq_linux_amd64 \
  && chmod +x /usr/bin/yq

CMD ["/bin/bash"]