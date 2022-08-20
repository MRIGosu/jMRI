FROM gitpod/workspace-full

USER gitpod

# Install some stuff
RUN sudo apt-get update \
    && sudo apt-get install -y \
        build-essential \
        libatomic1 \
        python \
        gfortran \
        perl \
        wget \
        m4 \
        cmake \
        pkg-config \
        curl \
    && sudo rm -rf /var/lib/apt/lists/* \
    && wget -O- https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.0-linux-x86_64.tar.gz | tar xvz \
    && sudo mv julia-1.8.0/ /opt/ \
    && sudo ln -s /opt/julia-1.8.0/bin/julia /usr/local/bin/julia

# Give control back to Gitpod Layer
USER root
