FROM jenkinsxio/builder-maven:0.0.249

# Node
RUN curl --silent --location https://rpm.nodesource.com/setup_9.x | bash - && \
  yum install -y nodejs gcc-c++ make bzip2 GConf2 gtk2 chromedriver chromium xorg-x11-server-Xvfb

RUN npm i -g watch-cli vsce typescript

# Yarn
ENV YARN_VERSION 1.3.2
RUN wget https://yarnpkg.com/downloads/${YARN_VERSION}/yarn-v${YARN_VERSION}.tar.gz -O /tmp/yarn.tar.gz && \
	tar zvxf /tmp/yarn.tar.gz -C /opt/yarn && \
	ln -s /opt/yarn/dist/bin/yarn /usr/local/bin/yarn

