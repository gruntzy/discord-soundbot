FROM node:13

LABEL maintainer="Marko Kajzer <markokajzer91@gmail.com>"

# Install ffmpeg and other deps
RUN apt-get update
RUN apt-get install --allow-unauthenticated -y ffmpeg git make python

WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn

COPY . /app

# Cleanup
# RUN apk del --quiet build-base

# Build
RUN yarn build

CMD ["yarn", "serve"]
