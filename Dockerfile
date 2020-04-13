FROM node:alpine
MAINTAINER Dave Eargle <dave@daveeargle.com>
LABEL description='Heroku CLI packaged on alpine linux'

# git
RUN apk update && apk add --no-cache git

# docker-cli
RUN apk update && apk add --no-cache docker-cli

# heroku cli
RUN apk update && apk add --no-cache curl bash
RUN curl https://cli-assets.heroku.com/install.sh | sh

ENTRYPOINT ["/usr/local/bin/heroku"]
