FROM ubuntu
RUN apt-get clean && apt-get update
RUN apt-get update 
RUN apt-get install -y curl
RUN apt-get install -y software-properties-common 
RUN apt-get install -y python3 
RUN apt-get install -y python3-pip
RUN pip3 install pymisp thehive4py
RUN pip3 install cortex4py
RUN pip3 install misp_stix_converter
COPY cron /etc/cron.d/cron
RUN chmod 0644 /etc/cron.d/cron
RUN crontab /etc/cron.d/cron
RUN touch /var/log/cron.log
CMD cron && /bin/bash
