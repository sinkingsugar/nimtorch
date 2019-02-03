FROM ubuntu:14.04

RUN apt-get update && apt-get install -y build-essential git python3-pip libmpfr-dev libgmp-dev wget

RUN pip3 install pyyaml
RUN pip3 install typing

RUN cd && \
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN cd && \
chmod +x Miniconda3-latest-Linux-x86_64.sh && \
./Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3

RUN /root/miniconda3/bin/conda install conda-build anaconda-client

SHELL ["/bin/bash", "-c"]
ENV PATH /root/miniconda3/bin:$PATH

ARG PYTORCH_COMMIT

RUN cd && \
git clone -b fragcolor-devel https://github.com/fragcolor-xyz/pytorch.git && \
cd pytorch && \
git reset --hard ${PYTORCH_COMMIT}

RUN cd && \
cd pytorch && \
git submodule init && \
git submodule update

RUN conda create -n deps cmake

RUN cd && \
cd pytorch && \
mkdir built && \
cd built && \
source activate deps && \
cmake -DPYTHON_EXECUTABLE=python -DCMAKE_INCLUDE_PATH=$CONDA_PREFIX/include -DCMAKE_LIBRARY_PATH=$CONDA_PREFIX/lib -DOpenMP_CXX_FLAGS="" -DOpenMP_C_FLAGS="" -DUSE_OPENMP=OFF -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release -DBUILD_ATEN_ONLY=ON -DCMAKE_INSTALL_PREFIX=`pwd`/output ../ && \
make install -j10 && \
make clean && \
cp ../tools/autograd/derivatives.yaml `pwd`/output/share/

COPY conda /root/conda

RUN cd && cd conda && \
source activate deps && \
export PATH=$PATH:/root/miniconda3/bin && \
export ATEN=/root/pytorch/built/output && \
conda build aten_lite

ARG TOKEN

RUN anaconda -t ${TOKEN} upload --skip /root/miniconda3/conda-bld/linux-64/aten-*.tar.bz2
