FROM ubuntu:24.04
RUN apt-get update && apt-get install build-essential cmake telnet -y
ADD external /external
WORKDIR /external
RUN gcc back10.c -o back10
#RUN ./back10 -l -f ./t20v4/tapes/BB-5254D-BM.tap -T e11

