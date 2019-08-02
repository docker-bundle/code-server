FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y zsh git \
    && apt-get clean

# Zsh Config
ENV PROMPT='%F{1}%n@%F{3}(Developer)%F{6}➜%F{2}%~%F{3}#%f ' RPROMPT="[%F{3}%?%f]"

RUN chsh -s /bin/zsh

# sbin
ADD sbin/* /usr/local/sbin/
