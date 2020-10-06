FROM nvidia/cuda:11.0-devel-centos8 AS base
RUN dnf install -y git gcc-gfortran make && git clone --depth 1 https://github.com/LeoXDXp/GPU-comcot.git /mnt  && cd /mnt && make -j 16

FROM nvidia/cuda:11.0-base-centos8
RUN dnf install -y gcc-gfortran
COPY --from=base /mnt/comcot /usr/local/bin/gpu-comcot
WORKDIR /sim
CMD gpu-comcot
