FROM ubuntu:24.04
RUN apt-get update && apt-get install build-essential cmake telnet -y

# build richard cornwll's simh kl10 https://github.com/rcornwell/sims
# have a copy of his repo in /external/sims
# cd /external/sims
# mkdir build
# cd build
# make sure there is LICENSE.txt can create an empty LICENSE.txt in /external/sims
# cmake ..
# make pdp10-kl # it's created in sims/BIN/pdp10-kl
#ADD external /external
#WORKDIR /external/t20v4
#RUN ./pdp10-kl test.ini


