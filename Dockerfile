FROM ubuntu

RUN apt update && apt install -y curl xz-utils postgresql-client
RUN curl https://cli-assets.heroku.com/install.sh | sh

ENTRYPOINT ["/bin/bash"]
