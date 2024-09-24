FROM homebrew/brew:latest

USER root

RUN apt update && apt install -y nano cron

RUN brew install dnscontrol

COPY src /app

RUN chmod +x /app/dane-tlsa-bot.sh
RUN chmod +x /app/init.sh

WORKDIR /app

CMD ["cron", "-f"]
#ENTRYPOINT [ "bash" ]

