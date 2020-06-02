FROM tercen/dartrusttidy:1.0.7

USER root
WORKDIR /operator

RUN git clone https://github.com/tercen/shiny_operator2.git

WORKDIR /operator/shiny_operator2

RUN echo 0.10.0 && git pull
RUN git checkout 0.10.0

RUN R -e "renv::restore(confirm=FALSE)"

ENTRYPOINT [ "R","--no-save","--no-restore","--no-environ","--slave","-f","main.R", "--args"]
CMD [ "--taskId", "someid", "--serviceUri", "https://tercen.com", "--token", "sometoken"]






