FROM nvidia/cuda:9.2-devel-ubuntu18.04

RUN apt-get update
RUN apt-get install -y build-essential git cmake python3-pip libmpfr-dev libgmp-dev

RUN pip3 install pyyaml
RUN pip3 install typing

RUN cd && \
git clone --depth=1 https://github.com/fragcolor-xyz/pytorch.git && \
cd pytorch && \
git reset --hard 5c0eece2fdca6006300875e002b1483bc7761854

RUN cd && \
cd pytorch && \
git submodule init && \
git submodule update third_party/sleef && \
git submodule update third_party/cpuinfo

ENV PYTORCH_PYTHON=python3

RUN cd && \
cd pytorch/aten && \
mkdir built && \
cd built && \
cmake -DCMAKE_BUILD_TYPE=Release -DUSE_CUDNN=OFF -DATEN_NO_TEST=ON -DCAFFE2_CMAKE_BUILDING_WITH_MAIN_REPO=OFF -DCMAKE_INSTALL_PREFIX=`pwd`/output ../ && \
make -j10 && \
make install -j10 && \
make clean && \
cp ../../tools/autograd/derivatives.yaml `pwd`/output/share/
