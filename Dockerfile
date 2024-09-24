FROM homebrew/brew:latest

USER root

RUN brew install dnscontrol

COPY src /app

RUN chmod +x /app/dane-tlsa-bot.sh

WORKDIR /app

ENTRYPOINT [ "bash" ]

