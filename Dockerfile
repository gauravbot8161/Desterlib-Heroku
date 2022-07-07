FROM python:3.10-slim

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y git curl unzip
RUN curl https://rclone.org/install.sh | bash

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get -y install nodejs

COPY . .

RUN chmod +x ./setup.sh

RUN ./setup.sh

CMD ["bash", "./start.sh"]
