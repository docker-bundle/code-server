FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y zsh git \
    && apt-get clean

# sbin
ADD sbin/* /usr/local/sbin/
RUN chmod +x /usr/local/sbin/*

# Zsh Config
ENV PROMPT='%F{5}%n%F{1}@%F{4}(%F{3}%W %*%F{4})%F{6}=>%F{2}[%~]%F{3}#%f ' RPROMPT='{%F{3}%?%f}'
RUN chsh -s /bin/zsh

# Timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# entry
ENTRYPOINT /usr/bin/zsh
