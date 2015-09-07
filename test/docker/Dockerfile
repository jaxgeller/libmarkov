FROM debian:jessie

# System Dependencies
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y git curl mercurial make binutils bison gcc build-essential

# Project Dependencies
RUN \
  cd /root && \

  # nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash && \

  # rvm
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
  \curl -sSL https://get.rvm.io | bash -s stable && \

  # gvm
  bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer) && \

  # init nvm and rvm
  source .bashrc && \
  source /etc/profile.d/rvm.sh && \
  source /root/.gvm/scripts/gvm && \

  # install
  nvm install iojs-v3.3.0 && \
  rvm install ruby-2.2.1 && \
  gvm install go1.5 && \
  gvm use go.1.5
