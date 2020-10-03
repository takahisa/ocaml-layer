FROM ghcr.io/takahisa/ocaml-layer/opam:system
RUN opam switch create 4.11.1 && opam switch 4.11.1 && eval $(opam config env) && opam update && opam install -y dune
RUN apt-get purge -y ocaml-nox ocaml-native-compilers \
 && apt-get clean
