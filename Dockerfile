FROM edran/ubuntu-desktop:16.04
MAINTAINER Nantas Nardelli <nantas.nardelli@gmail.com>

ARG git_branch=master

RUN apt-get update
RUN locale-gen en_US.UTF-8

RUN useradd tester
RUN mkdir /home/tester/

RUN chown -R tester:tester /home/tester && \
    echo 'tester ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/tester && \
    chmod 0440 /etc/sudoers.d/tester
USER tester

ENV HOME /home/tester
WORKDIR /home/tester
ENV GIT_AUTHOR_NAME Nantas Nardelli
ENV GIT_AUTHOR_EMAIL nantas.nardelli@gmail.com
ENV GIT_BRANCH $git_branch

RUN wget https://raw.githubusercontent.com/edran/.dotfiles/$GIT_BRANCH/install/install.sh
RUN chmod +x install.sh
RUN bash -v install.sh $GIT_BRANCH
