FROM homebrew/brew:latest

USER root

RUN brew install dnscontrol

COPY src /app

RUN chmod +x /app/dane-tlsa-bot.sh
RUN chmod +x /app/init.sh

WORKDIR /app

ENTRYPOINT [ "/bin/bash /app/init.sh" ]

