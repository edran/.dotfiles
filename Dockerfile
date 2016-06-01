FROM ubuntu:14.04
MAINTAINER Nantas Nardelli <nantas.nardelli@gmail.com>

RUN locale-gen en_US.UTF-8

RUN useradd tester
ADD . /home/tester/.dotfiles

RUN chown -R tester:tester /home/tester && \
    echo 'tester ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/tester && \
    chmod 0440 /etc/sudoers.d/tester
USER tester

ENV HOME /home/tester
ENV GIT_AUTHOR_NAME Nantas Nardelli
ENV GIT_AUTHOR_EMAIL nantas.nardelli@gmail.com

WORKDIR /home/tester/.dotfiles/install

run ./basic_dependencies.sh

WORKDIR /home/tester/.dotfiles
RUN git submodule update --init

WORKDIR /home/tester/.dotfiles/install
RUN sudo ./install.sh -n
RUN sudo ./ansible_install.sh