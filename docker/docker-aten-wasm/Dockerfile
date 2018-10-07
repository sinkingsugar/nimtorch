FROM base/devel

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm git cmake python python-pip mpfr gmp emscripten

RUN pip install pyyaml
RUN pip install typing

RUN cd && \
git clone --depth=1 -b fragcolor-devel https://github.com/fragcolor-xyz/pytorch.git && \
cd pytorch && \
git reset --hard 7a401c98ba24c07cc86ae245fa260a31cf58396d

RUN cd && \
cd pytorch && \
git submodule init && \
git submodule update

ENV PYTORCH_PYTHON=python3

RUN source /etc/profile.d/emscripten.sh && \
cd && \
cd pytorch && \
mkdir built && \
cd built && \
emcc --version && \
emconfigure cmake -DCMAKE_BUILD_TYPE=Release -DUSE_CUDA=OFF -DBUILD_ATEN_ONLY=ON -DCMAKE_INSTALL_PREFIX=`pwd`/output ../

RUN source /etc/profile.d/emscripten.sh && \
cd && \
cd pytorch && \
cd built && \
emmake make -j10 && \
emmake make install && \
emmake make clean && \
cp ../tools/autograd/derivatives.yaml `pwd`/output/share/
