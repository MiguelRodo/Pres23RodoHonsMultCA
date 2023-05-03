FROM rocker/verse:4.2.3

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils \
        gdebi-core \
        openssh-client \
        gnupg2 \
        dirmngr \
        iproute2 \
        procps \
        lsof \
        htop \
        net-tools \
        psmisc \
        curl \
        wget \
        rsync \
        ca-certificates \
        unzip \
        zip \
        nano \
        vim-tiny \
        less \
        jq \
        lsb-release \
        apt-transport-https \
        dialog \
        libc6 \
        libgcc1 \
        libkrb5-3 \
        libgssapi-krb5-2 \
        libicu[0-9][0-9] \
        libicu-dev \
        libstdc++6 \
        zlib1g \
        locales \
        sudo \
        ncdu \
        man-db \
        strace \
        manpages \
        manpages-dev \
        librdf0-dev \
        init-system-helpers

RUN apt-get -y install libsecret-1-0 \
    && apt-get -y install \
        python3-pip \
        libgit2-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        libxml2-dev \
        libxt-dev \
        libfontconfig1-dev \
        libcairo2-dev

RUN apt-get -y install \
      libgeos-dev \
      libgdal-dev \
      libproj-dev \
      libudunits2-dev \
      libsodium-dev \
      pandoc \
      openjdk-8-jdk \
      openjdk-8-jre \
      cargo \
      libfreetype6-dev \
      libclang-dev \
      fonts-roboto \
        && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip --no-cache-dir install radian \ 
    && echo "options(radian.editing_mode = 'vi')" > ~/.radian_profile \
    && echo "options(radian.auto_match = FALSE)" >> ~/.radian_profile

RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb \
    && gdebi -n quarto-linux-amd64.deb

RUN wget -qO \
    "/usr/local/bin/code-server" \
    "https://aka.ms/vscode-server-launcher/x86_64-unknown-linux-gnu" \
    && chmod a+x "/usr/local/bin/code-server"