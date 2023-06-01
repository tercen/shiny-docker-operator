#FROM tercen/dartrusttidy:1.0.7
FROM tercen/runtime-r40:4.0.4-6

USER root
WORKDIR /operator

RUN git clone https://github.com/tercen/shiny_operator2.git

WORKDIR /operator/shiny_operator2

RUN echo 0.12.0 && git pull
RUN git checkout 0.12.0

RUN R -e "renv::restore(confirm=FALSE)"

ENV TERCEN_SERVICE_URI https://tercen.com

COPY start.R /start.R

ENTRYPOINT [ "R","--no-save","--no-restore","--no-environ","--slave","-f","/start.R"]


#FROM tercen/runtime-r40:4.0.4-6
#
#USER root
#WORKDIR /operator
#
#COPY . .
#
#RUN R -e "install.packages('renv')"
#RUN R -e "install.packages(c('askpass', 'base64enc' , 'promises', 'rappdirs'))"
#
#RUN R -e "renv::consent(TRUE);renv::init()"
#
#ENV TERCEN_SERVICE_URI https://tercen.com
#
#COPY start.R /start.R
#
#ENTRYPOINT [ "R","--no-save","--no-restore","--no-environ","--slave","-f","/start.R"]






