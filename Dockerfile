FROM alpine:3.7

RUN apk add --update --no-cache curl bash postgresql-client libstdc++ \
    && curl https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub > /etc/apk/keys/sgerrand.rsa.pub \
    && curl -L https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-2.27-r0.apk -o glibc-2.27-r0.apk \
    && curl -L https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-bin-2.27-r0.apk -o glibc-bin-2.27-r0.apk \
    && apk add glibc-2.27-r0.apk glibc-bin-2.27-r0.apk \
    && curl https://cli-assets.heroku.com/install.sh | sh \
    && apk del curl \
    && rm glibc-2.27-r0.apk glibc-bin-2.27-r0.apk

ENTRYPOINT ["/bin/bash"]
