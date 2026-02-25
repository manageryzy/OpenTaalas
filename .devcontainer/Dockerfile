FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

# ── 1. System packages ──────────────────────────────────────────────
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc g++ make git curl wget ca-certificates \
    python3 python3-pip \
    ninja-build pkg-config autoconf automake \
    flex bison libfl-dev \
    zlib1g-dev help2man perl \
    libgmp-dev libffi-dev libncurses-dev \
    locales \
    openjdk-17-jdk-headless \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# ── 2. CMake 3.31 ───────────────────────────────────────────────────
ARG CMAKE_VER=3.31.6
RUN wget -qO /tmp/cmake.tar.gz \
    "https://github.com/Kitware/CMake/releases/download/v${CMAKE_VER}/cmake-${CMAKE_VER}-linux-x86_64.tar.gz" \
    && tar -xzf /tmp/cmake.tar.gz -C /opt \
    && ln -s /opt/cmake-${CMAKE_VER}-linux-x86_64/bin/* /usr/local/bin/ \
    && rm /tmp/cmake.tar.gz

# ── 3. Boost 1.88.0 (header-only + system/filesystem) ──────────────
ARG BOOST_VER=1.88.0
ARG BOOST_VER_US=1_88_0
RUN wget -qO /tmp/boost.tar.gz \
    "https://archives.boost.io/release/${BOOST_VER}/source/boost_${BOOST_VER_US}.tar.gz" \
    && tar -xzf /tmp/boost.tar.gz -C /tmp \
    && cd /tmp/boost_${BOOST_VER_US} \
    && ./bootstrap.sh --prefix=/opt/boost --with-libraries=system,filesystem \
    && ./b2 install -j$(nproc) --prefix=/opt/boost \
    && rm -rf /tmp/boost*

ENV Boost_DIR=/opt/boost/lib/cmake/Boost-1.88.0

# ── 4. Verilator 5.040 ─────────────────────────────────────────────
ARG VERILATOR_VER=5.040
RUN git clone --depth 1 --branch v${VERILATOR_VER} \
    https://github.com/verilator/verilator.git /tmp/verilator \
    && cd /tmp/verilator \
    && autoconf && ./configure && make -j$(nproc) \
    && make install \
    && rm -rf /tmp/verilator

# ── 5. ghcup → GHC 9.6.7 + cabal 3.12.1.0 ─────────────────────────
ENV GHCUP_INSTALL_BASE_PREFIX=/opt
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | \
    BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
    BOOTSTRAP_HASKELL_GHC_VERSION=9.6.7 \
    BOOTSTRAP_HASKELL_CABAL_VERSION=3.12.1.0 \
    BOOTSTRAP_HASKELL_INSTALL_NO_STACK=1 \
    sh

ENV PATH="/opt/.ghcup/bin:${PATH}"
ENV CABAL_DIR=/opt/cabal
RUN cabal update

# ── 6. Mill 0.11.1 (Chisel build tool) ─────────────────────────────
ARG MILL_VER=0.11.1
RUN curl -L "https://github.com/com-lihaoyi/mill/releases/download/${MILL_VER}/${MILL_VER}-assembly" \
    -o /usr/local/bin/mill \
    && chmod +x /usr/local/bin/mill

# ── 7. firtool 1.59.0 (FIRRTL → SV compiler) ──────────────────────
ARG FIRTOOL_VER=1.59.0
RUN wget -qO- \
    "https://github.com/llvm/circt/releases/download/firtool-${FIRTOOL_VER}/circt-full-shared-linux-x64.tar.gz" \
    | tar -xz -C /opt \
    && ln -s /opt/firtool-${FIRTOOL_VER}/bin/firtool /usr/local/bin/firtool

ENV LD_LIBRARY_PATH="/opt/firtool-1.59.0/lib:${LD_LIBRARY_PATH}"

# ── User (match host UID/GID to avoid permission issues) ───────────
ARG USER_UID=1000
ARG USER_GID=1000
RUN if getent passwd $USER_UID >/dev/null; then \
      existing=$(getent passwd $USER_UID | cut -d: -f1); \
      usermod -l dev -d /home/dev -m "$existing"; \
      groupmod -n dev $(getent group $USER_GID | cut -d: -f1) 2>/dev/null || true; \
    else \
      groupadd --gid $USER_GID dev 2>/dev/null || true; \
      useradd --uid $USER_UID --gid $USER_GID -m -s /bin/bash dev; \
    fi \
    && chown -R $USER_UID:$USER_GID /opt/.ghcup \
    && chown -R $USER_UID:$USER_GID /opt/cabal

USER dev
WORKDIR /workspace
