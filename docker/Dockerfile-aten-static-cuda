FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

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

RUN cd && \
wget https://dist.ipfs.io/ipget/v0.3.0/ipget_v0.3.0_linux-amd64.tar.gz && \
tar xzf ipget_v0.3.0_linux-amd64.tar.gz

# download magma 2.4.0 pre built using same docker images - static version
RUN cd && ipget/./ipget QmPJzXEGzphTzogPsS6uQRYNxNaqF1i5fdi34SE2DL6v4i -o magmalib.tar.gz && tar xzf magmalib.tar.gz
ENV MAGMA_HOME=/root/libmagma

# -DUSE_MKLDNN=OFF is off due to buggy JIT on my VM PC :-(
RUN cd && \
cd pytorch && \
mkdir built && \
cd built && \
cmake -DPYTHON_EXECUTABLE=python -DUSE_MKLDNN=OFF -DUSE_MKL=OFF -DUSE_OPENMP=ON -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release -DBUILD_ATEN_ONLY=ON -DCMAKE_INSTALL_PREFIX=`pwd`/output ../ && \
make install -j10 && \
make clean && \
cp ../tools/autograd/derivatives.yaml `pwd`/output/share/

# merge with magma
RUN cp -r $MAGMA_HOME/* /root/pytorch/built/output/

COPY conda /root/conda

RUN cd && cd conda && \
export PATH=$PATH:/root/miniconda3/bin && \
export ATEN=/root/pytorch/built/output && \
conda build aten

ARG TOKEN

RUN anaconda -t ${TOKEN} upload --skip /root/miniconda3/conda-bld/linux-64/aten-*.tar.bz2