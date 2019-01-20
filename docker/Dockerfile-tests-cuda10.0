FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

RUN apt-get update && apt-get install -y build-essential git cmake python3-pip libmpfr-dev libgmp-dev wget curl

RUN pip3 install pyyaml
RUN pip3 install typing

ARG USER_ID
ARG GROUP_ID

RUN useradd -ms /bin/bash -u ${USER_ID} tester

RUN apt-get install -y clang

USER tester

WORKDIR /home/tester

RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN chmod +x Miniconda3-latest-Linux-x86_64.sh && \
./Miniconda3-latest-Linux-x86_64.sh -b -p /home/tester/miniconda3

ENV PATH=$PATH:/home/tester/miniconda3/bin

ARG ATEN

RUN conda install -c fragcolor nim=0.19.9.1 fragments=0.1.27 ${ATEN}

ENV ATEN=/home/tester/miniconda3

COPY --chown=tester ./ /home/tester/nimtorch

WORKDIR /home/tester/nimtorch

ENV HOME=/home/tester
