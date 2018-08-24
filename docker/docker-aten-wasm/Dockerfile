FROM nvidia/cuda:9.2-devel-ubuntu18.04

RUN apt-get update
RUN apt-get install -y build-essential git cmake python3-pip libmpfr-dev libgmp-dev emscripten

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
emconfigure cmake -DUSE_CUDA=OFF -Wno-deprecated -DATEN_NO_TEST=ON -DCMAKE_BUILD_TYPE=Release -DCAFFE2_CMAKE_BUILDING_WITH_MAIN_REPO=OFF -DCMAKE_C_FLAGS="-Wno-implicit-function-declaration -DEMSCRIPTEN -s DISABLE_EXCEPTION_CATCHING=0" -DCMAKE_CXX_FLAGS="-Wno-implicit-function-declaration -DEMSCRIPTEN -s DISABLE_EXCEPTION_CATCHING=0" -DCMAKE_INSTALL_PREFIX=`pwd`/output ../

RUN cd && \
cd pytorch/aten && \
cd built && \
emmake make -j10 && \
emmake make install && \
emmake make clean && \
cp ../../tools/autograd/derivatives.yaml `pwd`/output/share/
