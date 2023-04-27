# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.194.0/containers/java-8/.devcontainer/base.Dockerfile

ARG VARIANT=11
FROM mcr.microsoft.com/vscode/devcontainers/java:${VARIANT}

# [Option] Install Maven
ARG INSTALL_MAVEN="false"
ARG MAVEN_VERSION=""
# [Option] Install Gradle
ARG INSTALL_GRADLE="false"
ARG GRADLE_VERSION=""
RUN if [ "${INSTALL_MAVEN}" = "true" ]; then su vscode -c "umask 0002 && . /usr/local/sdkman/bin/sdkman-init.sh && sdk install maven \"${MAVEN_VERSION}\""; fi \
    && if [ "${INSTALL_GRADLE}" = "true" ]; then su vscode -c "umask 0002 && . /usr/local/sdkman/bin/sdkman-init.sh && sdk install gradle \"${GRADLE_VERSION}\""; fi

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="lts/*"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# These commands were added to address an expired key issue based on the suggestions in this thread: https://github.com/yarnpkg/yarn/issues/7866
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN sudo apt update
RUN sudo apt install yarn

RUN apt-get update && apt-get -y install python3 python3-pip gosu openssl wget graphviz
RUN pip3 install --upgrade  requests zulip

# [Optional] Uncommet this section to install ruby and jekyll support (only required for publisher builds)
# ENV PATH="/usr/local/rvm/bin:/usr/local/rvm/rubies/ruby-2.5.1/bin:${PATH}"
# RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
#    curl -L get.rvm.io | bash -s stable  && \
#    rvm install 2.5.1 && \
#    gem install jekyll jekyll-asciidoc

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1