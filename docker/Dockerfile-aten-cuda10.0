FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

RUN apt-get update && apt-get install -y build-essential git cmake python3-pip libmpfr-dev libgmp-dev wget curl

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
git submodule update --init --recursive

RUN conda create -n deps mkl mkl-include intel-openmp

# download magma 2.4.0 pre built using same docker images - dynamic version
RUN cd && curl -L -o magmalib.tar.gz "https://drive.google.com/uc?export=download&id=1ABrWQxC9FxVSxa9tBx340jhsfg-4etjJ" && tar xzf magmalib.tar.gz
ENV MAGMA_HOME=/root/output

RUN cd && \
cd pytorch && \
mkdir built && \
cd built && \
source activate deps && \
cmake -DPYTHON_EXECUTABLE=python -DCMAKE_INCLUDE_PATH=$CONDA_PREFIX/include -DCMAKE_LIBRARY_PATH=$CONDA_PREFIX/lib -DUSE_MKLDNN=OFF -DUSE_MKL=ON -DBLAS=MKL -DUSE_OPENMP=ON -DCMAKE_BUILD_TYPE=Release -DBUILD_ATEN_ONLY=ON -DCMAKE_INSTALL_PREFIX=`pwd`/output ../ && \
make install -j10 && \
make clean && \
cp ../tools/autograd/derivatives.yaml `pwd`/output/share/

# merge with magma lib
RUN cp -r /root/output/* /root/pytorch/built/output/

COPY conda /root/conda

RUN cd && cd conda && \
source activate deps && \
export PATH=$PATH:/root/miniconda3/bin && \
export ATEN=/root/pytorch/built/output && \
conda build aten

ARG TOKEN

RUN anaconda -t ${TOKEN} upload /root/miniconda3/conda-bld/linux-64/aten-*.tar.bz2
