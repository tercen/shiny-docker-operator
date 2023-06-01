FROM tercen/dartrusttidy:1.0.7

USER root
WORKDIR /operator

COPY . .

RUN R -e "renv::consent(TRUE);renv::init()"

ENV TERCEN_SERVICE_URI https://tercen.com

COPY start.R /start.R

ENTRYPOINT [ "R","--no-save","--no-restore","--no-environ","--slave","-f","/start.R"]






