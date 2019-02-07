FROM archlinux/base

RUN pacman -Syu --noconfirm && pacman -S --noconfirm base-devel git cmake python python-pip mpfr gmp emscripten wget

RUN pip install pyyaml
RUN pip install typing

ARG USER_ID
ARG GROUP_ID

RUN useradd -ms /bin/bash -u ${USER_ID} tester

USER tester

WORKDIR /home/tester

RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN chmod +x Miniconda3-latest-Linux-x86_64.sh && \
./Miniconda3-latest-Linux-x86_64.sh -b -p /home/tester/miniconda3

ENV PATH=$PATH:/home/tester/miniconda3/bin

ARG ATEN

RUN conda install -c fragcolor nim=0.19.9.1 fragments=0.1.27 ${ATEN} wasm

ENV ATEN=/home/tester/miniconda3

COPY --chown=tester ./ /home/tester/nimtorch

WORKDIR /home/tester/nimtorch

ENV HOME=/home/tester

# needed to init wasm
RUN source /etc/profile.d/emscripten.sh && emcc --version && touch emcc.nim && nim torch -d:wasm -o:emcc.js emcc.nim && rm emcc.js emcc.nim
