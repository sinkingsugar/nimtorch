FROM archlinux/base

RUN pacman -Syu --noconfirm && pacman -S --noconfirm base-devel git cmake python python-pip mpfr gmp emscripten wget

RUN pip install pyyaml
RUN pip install typing

RUN cd && \
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN cd && \
chmod +x Miniconda3-latest-Linux-x86_64.sh && \
./Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3

RUN /root/miniconda3/bin/conda install conda-build anaconda-client

ARG PYTORCH_COMMIT

RUN cd && \
git clone -b fragcolor-devel https://github.com/fragcolor-xyz/pytorch.git && \
cd pytorch && \
git reset --hard ${PYTORCH_COMMIT}

RUN cd && \
cd pytorch && \
git submodule init && \
git submodule update

RUN source /etc/profile.d/emscripten.sh && \
cd && \
cd pytorch && \
mkdir built && \
cd built && \
emcc --version && \
emconfigure cmake -DPYTHON_EXECUTABLE=python -DCMAKE_BUILD_TYPE=Release -DUSE_CUDA=OFF -DBUILD_ATEN_ONLY=ON -DCMAKE_INSTALL_PREFIX=`pwd`/output ../

RUN source /etc/profile.d/emscripten.sh && \
cd && \
cd pytorch && \
cd built && \
emmake make install && \
emmake make clean && \
cp ../tools/autograd/derivatives.yaml `pwd`/output/share/

COPY conda /root/conda

RUN cd && cd conda && \
export PATH=$PATH:/root/miniconda3/bin && \
export ATEN=/root/pytorch/built/output && \
conda build aten_wasm

ARG TOKEN

RUN /root/miniconda3/bin/anaconda -t ${TOKEN} upload /root/miniconda3/conda-bld/noarch/aten-*.tar.bz2
