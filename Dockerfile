# eclipse 에서 제공하는 jdk8 base image
FROM eclipse/ubuntu_jdk8

# optional : ensure that pip is up to data
RUN apt-get update -y

RUN apt update -y

# install git and pre-install packages
RUN apt install git -y
RUN apt install gcc-3.4.6.-11 -y
RUN apt install gcc-c++-3.4.6.-11 -y
RUN apt install libgcc-3.4.6.-11 -y
RUN apt install libstdc++-3.4.6-11 -y 
RUN apt install libstdc++-devel-3.4.6-11 -y
RUN apt install compat-libstdc++-33-3.2.3-47.3 -y
RUN apt install libaio-0.3.105-2 -y
RUN apt install libaio-devel-0.3.105-2 -y

# git clone
RUN git clone https://github.com/emptyinteger/ezis_tibero6.git

# install packages
# RUN pip install -r ezis_tibero6/requirements.txt

# repo direcetory create and cp license.xml to repo and /home/tibero/Tibero/tibero6
RUN mkdir ~/repo
RUN mkdir ~/tibero
RUN mkdir ~/tibero/Tibero
RUN mkdir ~/tibero/Tibero/tibero6

RUN cp ezis_tibero6/license.xml ~/repo
RUN cp ezis_tibero6/license.xml ~/tibero/Tibero/tibero6/license

RUN cp ezis_tibero6/tibero6-bin-FS07_CS_2005-linux64-186930-opt-tested.tar.gz ~/

# Lambda_function.handler 실행
RUN tar -zxvf tibero6-bin-FS07_CS_2005-linux64-186930-opt-tested.tar.gz
