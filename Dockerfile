FROM haskell:8 
# AS builder

RUN apt-get update -qq && \
  apt-get install -qq -y libpcre3 libpcre3-dev build-essential --fix-missing --no-install-recommends && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /log

WORKDIR /duckling

ADD stack.yaml .

ENV LANG=C.UTF-8

ADD . .

RUN stack setup

# NOTE:`stack build` will use as many cores as are available to build
# in parallel. However, this can cause OOM issues as the linking step
# in GHC can be expensive. If the build fails, try specifying the
# '-j1' flag to force the build to run sequentially.
RUN stack install

# Comentar esta parte para hacer el test de Duckling con el comando
# stack test
# 
# FROM debian:buster
# 
# ENV LANG C.UTF-8
# 
# RUN apt-get update -qq && \
#   apt-get install -qq -y libpcre3 libgmp10 --no-install-recommends && \
#   apt-get clean && \
#   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# 
# COPY --from=builder /root/.local/bin/duckling-example-exe /usr/local/bin/
# 
# EXPOSE 8000
# 
# CMD ["duckling-example-exe", "-p", "8000", "--no-access-log", "--no-error-log"]]
