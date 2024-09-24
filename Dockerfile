FROM homebrew/brew:latest

RUN sudo apt update && sudo apt install -y nano cron

RUN brew install dnscontrol

COPY src /app

RUN sudo chmod +x /app/dane-tlsa-bot.sh
RUN sudo chmod +x /app/init.sh
RUN sudo chmod -R 777 /app 
#RUN chown -R root:root /app

ADD src/cronjob /etc/cronjob
RUN sudo crontab /etc/cronjob

WORKDIR /app

CMD ["/app/init.sh"]
#ENTRYPOINT [ "bash" ]

