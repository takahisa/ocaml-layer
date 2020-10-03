FROM ubuntu:bionic
RUN apt-get update \
 && apt-get install -y \
      apt-transport-https \
      ca-certificates \
      software-properties-common \
      git
RUN add-apt-repository -y ppa:avsm/ppa
RUN apt-get update \
 && apt-get install -y \
      opam \
      ocaml-nox \
      ocaml-native-compilers \
      build-essential \
      m4 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN opam init -a --disable-sandboxing
