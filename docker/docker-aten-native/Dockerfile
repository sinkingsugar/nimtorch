FROM nvidia/cuda:9.2-devel-ubuntu18.04

RUN apt-get update
RUN apt-get install -y build-essential git cmake python3-pip libmpfr-dev libgmp-dev

RUN pip3 install pyyaml
RUN pip3 install typing

RUN cd && \
git clone --depth=1 -b fragcolor-devel https://github.com/fragcolor-xyz/pytorch.git && \
cd pytorch && \
git reset --hard 7a401c98ba24c07cc86ae245fa260a31cf58396d

RUN cd && \
cd pytorch && \
git submodule init && \
git submodule update

ENV PYTORCH_PYTHON=python3

RUN cd && \
cd pytorch && \
mkdir built && \
cd built && \
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_ATEN_ONLY=ON -DCMAKE_INSTALL_PREFIX=`pwd`/output ../ && \
make -j10 && \
make install -j10 && \
make clean && \
cp ../tools/autograd/derivatives.yaml `pwd`/output/share/
