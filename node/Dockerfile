FROM orctom/alpine:3.2

ENV NPM_CONFIG_LOGLEVEL warn
ENV NODE_VERSION 4.3.1

RUN \
  curl -fL https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz -o /tmp/node-v${NODE_VERSION}-linux-x64.tar.xz \
  && unxz /tmp/node-v${NODE_VERSION}-linux-x64.tar.xz \
  && tar -xf /tmp/node-v${NODE_VERSION}-linux-x64.tar -C /usr/local --strip-components=1 \
  && rm -rf /tmp/node-v${NODE_VERSION}-linux-x64.tar /tmp/npm* \
  && curl -fL https://raw.githubusercontent.com/orctom/alpine-glibc-packages/master/usr/lib/libstdc++.so.6.0.21 -o /usr/lib/libstdc++.so.6.0.21 \
  && ln -s /usr/lib/libstdc++.so.6.0.21 /usr/lib/libstdc++.so.6 \
  && npm install -g gulp-cli bower \
  && apk add --update git && rm -rf /var/cache/apk/* \
  && git config --global url."https://".insteadOf git://

ONBUILD ADD package.json /app/
ONBUILD RUN npm installd
ONBUILD ADD bower.json /app/
ONBUILD RUN bower install --allow-root
ONBUILD ADD . /app
ONBUILD RUN gulp build

# Define working directory.
WORKDIR /app

# Define default command.
CMD ["npm", "start"]
