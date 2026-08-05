# Two-stage build. The builder compiles SoPlex, PaPILO and SCIP (twice); the final
# stage copies only the installed prefixes, so no source or object files ship.
#
# Built once in CI and published to ghcr.io/gtjusila/cio-ss-2026 -- students pull it
# rather than compiling SCIP themselves. See .github/workflows/devcontainer-image.yml.

# ---------------------------------------------------------------------------------
# Builder
# ---------------------------------------------------------------------------------
FROM ubuntu:26.04 AS builder

ARG CLANG_VERSION=22
ARG CMAKE_VERSION=4.4.2

# SCIP Optimization Suite 10.0.3 set -- all published within
ARG SOPLEX_TAG=v8.0.3
ARG PAPILO_TAG=v3.0.1
ARG SCIP_TAG=v10.0.3
ARG TARGETARCH

ENV DEBIAN_FRONTEND=noninteractive

# LLVM is pinned to one major, same as the toolchain pin this replaced. clang-N
# Depends on the matching libstdc++-N-dev, which is where the C++ headers come from
# -- clang here uses GNU libstdc++, not libc++. That is deliberate: apt's boost and
# TBB are built against libstdc++, so a libc++ build would put two incompatible STLs
# in one process. lld is required rather than nice-to-have; see the LTO note below.
RUN apt-get update && apt-get install -y --no-install-recommends \
        "clang-${CLANG_VERSION}" \
        "lld-${CLANG_VERSION}" \
        "llvm-${CLANG_VERSION}" \
        make \
        libc6-dev \
        libgmp-dev \
        libmpfr-dev \
        zlib1g-dev \
        libreadline-dev \
        libboost-program-options-dev \
        libboost-serialization-dev \
        libboost-regex-dev \
        libboost-iostreams-dev \
        libcliquer-dev \
        libmetis-dev \
        libtbb-dev \
        bison \
        flex \
        ca-certificates \
        wget \
        git \
    && rm -rf /var/lib/apt/lists/*

# The versioned packages install /usr/bin/clang-22 and friends but no unversioned
# names, so register them. ld.lld matters specifically: -fuse-ld=lld makes clang look
# for a binary called "ld.lld" on PATH, and lld-22 only ships "ld.lld-22". llvm-ar and
# llvm-ranlib are what CMake picks up for LTO archives.
RUN update-alternatives --install /usr/bin/clang clang "/usr/bin/clang-${CLANG_VERSION}" 100 \
        --slave /usr/bin/clang++ clang++ "/usr/bin/clang++-${CLANG_VERSION}" \
        --slave /usr/bin/ld.lld ld.lld "/usr/bin/ld.lld-${CLANG_VERSION}" \
        --slave /usr/bin/llvm-ar llvm-ar "/usr/bin/llvm-ar-${CLANG_VERSION}" \
        --slave /usr/bin/llvm-ranlib llvm-ranlib "/usr/bin/llvm-ranlib-${CLANG_VERSION}" \
    && test "$(clang -dumpversion | cut -d. -f1)" = "${CLANG_VERSION}" \
    && test "$(ld.lld --version | grep -o '[0-9]\+' | head -1)" = "${CLANG_VERSION}" \
    && clang++ -x c++ -std=c++20 -c /dev/null -o /dev/null

RUN set -eux; \
    case "${TARGETARCH:-$(dpkg --print-architecture)}" in \
        amd64) cmake_arch=x86_64 ;; \
        arm64) cmake_arch=aarch64 ;; \
        *) echo "unsupported architecture" >&2; exit 1 ;; \
    esac; \
    wget -qO /tmp/cmake.tar.gz \
        "https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-${cmake_arch}.tar.gz"; \
    mkdir -p /opt/cmake; \
    tar -xzf /tmp/cmake.tar.gz -C /opt/cmake --strip-components=1; \
    rm /tmp/cmake.tar.gz; \
    for tool in cmake ctest cpack; do ln -s "/opt/cmake/bin/${tool}" "/usr/local/bin/${tool}"; done

# Every cmake call below pins clang and lld. -fuse-ld=lld is not cosmetic: the
# student targets set INTERPROCEDURAL_OPTIMIZATION ON, and clang's LTO needs a
# linker that understands LLVM bitcode. ld.bfd only manages it via the LLVMgold
# plugin, which is exactly the setup that fails with "file format not recognized".
# lld reads bitcode natively.

# SoPlex and PaPILO are built Release only. Mixing a Release SoPlex with a Debug
# SCIP is safe -- they are separate shared libraries, same compiler, and neither
# build defines _GLIBCXX_DEBUG, so the libstdc++ ABI is identical.
RUN set -eux; \
    git clone --quiet --depth 1 --branch "${SOPLEX_TAG}" https://github.com/scipopt/soplex.git /src/soplex; \
    cmake -S /src/soplex -B /src/soplex/build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_EXE_LINKER_FLAGS=-fuse-ld=lld \
        -DCMAKE_SHARED_LINKER_FLAGS=-fuse-ld=lld \
        -DCMAKE_INSTALL_PREFIX=/opt/soplex; \
    cmake --build /src/soplex/build -j "$(nproc)"; \
    cmake --install /src/soplex/build; \
    test -f /opt/soplex/lib/cmake/soplex/soplex-config.cmake

RUN set -eux; \
    git clone --quiet --depth 1 --branch "${PAPILO_TAG}" https://github.com/scipopt/papilo.git /src/papilo; \
    cmake -S /src/papilo -B /src/papilo/build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_EXE_LINKER_FLAGS=-fuse-ld=lld \
        -DCMAKE_SHARED_LINKER_FLAGS=-fuse-ld=lld \
        -DCMAKE_INSTALL_PREFIX=/opt/papilo; \
    cmake --build /src/papilo/build -j "$(nproc)"; \
    cmake --install /src/papilo/build; \
    test -f /opt/papilo/lib/cmake/papilo/papilo-config.cmake

# SCIP twice, into separate prefixes. AUTOBUILD is deliberately off: it turns the
# optional-component searches into "find whatever happens to be installed", which is
# how a stray PaPILO got pulled in before. Everything wanted is named explicitly.
#
# Note the dotted tag. There is also an ancient `v1003` (SCIP 1.0.0.3, CVS-era, no
# CMakeLists.txt at all) which is NOT this release.
RUN git clone --quiet --depth 1 --branch "${SCIP_TAG}" https://github.com/scipopt/scip.git /src/scip

RUN set -eux; \
    for cfg in Release Debug; do \
        prefix="/opt/scip/$(echo "${cfg}" | tr '[:upper:]' '[:lower:]')"; \
        cmake -S /src/scip -B "/src/scip/build-${cfg}" \
            -DCMAKE_BUILD_TYPE="${cfg}" \
            -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
            -DCMAKE_C_COMPILER=clang \
            -DCMAKE_CXX_COMPILER=clang++ \
            -DCMAKE_EXE_LINKER_FLAGS=-fuse-ld=lld \
            -DCMAKE_SHARED_LINKER_FLAGS=-fuse-ld=lld \
            -DCMAKE_INSTALL_PREFIX="${prefix}" \
            -DAUTOBUILD=OFF \
            -DLPS=spx \
            -DSOPLEX_DIR=/opt/soplex/lib/cmake/soplex \
            -DPAPILO=ON \
            -DPAPILO_DIR=/opt/papilo/lib/cmake/papilo \
            -DZIMPL=OFF \
            -DIPOPT=OFF \
            -DEXACTSOLVE=OFF; \
        cmake --build "/src/scip/build-${cfg}" -j "$(nproc)"; \
        cmake --install "/src/scip/build-${cfg}"; \
        test -f "${prefix}/lib/cmake/scip/scip-config.cmake"; \
    done

# Strip everything that is not source or compile flags, so the tree can ship for
# reference. Object files are the bulk and .git is dead weight, but build-Debug is
# not deleted outright: it holds compile_commands.json AND the headers CMake
# generates (scip/config.h, scip/scipgithash.h). Delete those and clangd reports
# every SCIP source file as missing its own config header.
#
# compile_commands.json is also copied to the top of the tree. clangd searches a
# file's ancestor directories, so from /src/scip/src/scip/foo.c it finds
# /src/scip/compile_commands.json and indexes SCIP with the real debug flags.
RUN set -eux; \
    rm -rf /src/scip/.git /src/scip/build-Release; \
    rm -rf /src/scip/build-Debug/CMakeFiles \
           /src/scip/build-Debug/bin \
           /src/scip/build-Debug/lib; \
    find /src/scip/build-Debug -name '*.o' -delete; \
    cp /src/scip/build-Debug/compile_commands.json /src/scip/compile_commands.json; \
    du -sh /src/scip

# ---------------------------------------------------------------------------------
# Final image
# ---------------------------------------------------------------------------------
FROM ubuntu:26.04

ARG USERNAME=ubuntu
ARG CLANG_VERSION=22
# Both agents install as single native binaries -- no Node in this image. Versions
# float by default: these CLIs talk to a moving server API and a stale pin stops
# working outright. For a reproducible image set them to exact versions instead
# (CLAUDE_CODE_VERSION=2.1.4, CODEX_VERSION=0.146.0); both installers accept one.
ARG CLAUDE_CODE_VERSION=stable
ARG CODEX_VERSION=latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        "clang-${CLANG_VERSION}" \
        "clangd-${CLANG_VERSION}" \
        "clang-format-${CLANG_VERSION}" \
        "lld-${CLANG_VERSION}" \
        "lldb-${CLANG_VERSION}" \
        "llvm-${CLANG_VERSION}" \
        make \
        libc6-dev \
        libgmp-dev \
        libmpfr-dev \
        zlib1g-dev \
        libreadline-dev \
        libboost-program-options-dev \
        libboost-serialization-dev \
        libboost-regex-dev \
        libboost-iostreams-dev \
        libcliquer-dev \
        libmetis-dev \
        libtbb-dev \
        ca-certificates \
        git \
        sudo \
        vim \
        less \
        procps \
        file \
        pkg-config \
        curl \
    && rm -rf /var/lib/apt/lists/*

# Ubuntu ships a profile.d snippet setting DEBUGINFOD_URLS=https://debuginfod.ubuntu.com
# in every login shell. Both gdb and lldb honour that variable, so the debugger stalls
# on symbol fetches before ever reaching main -- 90s per library when egress is
# filtered rather than refused. gdb is gone now, but lldb reads the same variable, so
# this stays.
RUN rm -f /etc/profile.d/debuginfod.sh /etc/profile.d/debuginfod.csh

# Same alternatives as the builder, plus the three the editor reaches for by
# unversioned name: clangd.path and the clang-format extension both expect
# /usr/bin/<tool>, and CodeLLDB is happy either way but terminal `lldb` is not.
RUN update-alternatives --install /usr/bin/clang clang "/usr/bin/clang-${CLANG_VERSION}" 100 \
        --slave /usr/bin/clang++ clang++ "/usr/bin/clang++-${CLANG_VERSION}" \
        --slave /usr/bin/clangd clangd "/usr/bin/clangd-${CLANG_VERSION}" \
        --slave /usr/bin/clang-format clang-format "/usr/bin/clang-format-${CLANG_VERSION}" \
        --slave /usr/bin/lldb lldb "/usr/bin/lldb-${CLANG_VERSION}" \
        --slave /usr/bin/ld.lld ld.lld "/usr/bin/ld.lld-${CLANG_VERSION}" \
        --slave /usr/bin/llvm-ar llvm-ar "/usr/bin/llvm-ar-${CLANG_VERSION}" \
        --slave /usr/bin/llvm-ranlib llvm-ranlib "/usr/bin/llvm-ranlib-${CLANG_VERSION}" \
    && test "$(clang -dumpversion | cut -d. -f1)" = "${CLANG_VERSION}" \
    && clangd --version \
    && lldb --version

# Default the terminal toolchain to clang too, so a hand-rolled `cmake -S . -B build`
# matches what VS Code configures rather than silently picking up a stray cc.
ENV CC=clang \
    CXX=clang++

COPY --from=builder /opt/cmake /opt/cmake
COPY --from=builder /opt/soplex /opt/soplex
COPY --from=builder /opt/papilo /opt/papilo
COPY --from=builder /opt/scip /opt/scip

# SCIP's source, for reading -- nothing links against it. The path is not arbitrary:
# the debug build was compiled here, so DWARF names these exact paths. Putting the
# tree back at /src/scip means stepping into SCIPsolve under the debugger lands on
# real source with no sourceMap entry to configure. Moving it elsewhere silently
# costs that.
COPY --from=builder /src/scip /src/scip

RUN for tool in cmake ctest cpack; do ln -s "/opt/cmake/bin/${tool}" "/usr/local/bin/${tool}"; done \
    && cmake --version \
    && /opt/scip/release/bin/scip -c quit \
    && /opt/scip/debug/bin/scip -c quit

# Smoke test the exact shape the student targets use: C++20, LTO, lld, linked against
# the copied libscip. Catches a missing libstdc++-dev or a broken LTO link here rather
# than in front of a room of students.
RUN set -eux; \
    printf '#include <scip/scip.h>\nint main(){SCIP*s=nullptr;SCIPcreate(&s);SCIPfree(&s);}\n' > /tmp/t.cpp; \
    clang++ -std=c++20 -flto -fuse-ld=lld /tmp/t.cpp \
        -I/opt/scip/release/include -L/opt/scip/release/lib -lscip \
        -Wl,-rpath,/opt/scip/release/lib -o /tmp/t; \
    /tmp/t; \
    rm -f /tmp/t.cpp /tmp/t

# Discoverability: /src is not somewhere anyone thinks to look, and the reference
# tree is useless if nobody finds it. Symlink it next to the install prefixes.
RUN test -d /src/scip/src/scip \
    && ln -s /src/scip /opt/scip/source \
    && echo "SCIP source for reference: /opt/scip/source (-> /src/scip)"

RUN if ! id -u "${USERNAME}" >/dev/null 2>&1; then \
        groupadd --gid 1000 "${USERNAME}" \
        && useradd --uid 1000 --gid 1000 --create-home --shell /bin/bash "${USERNAME}"; \
    fi \
    && echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > "/etc/sudoers.d/${USERNAME}" \
    && chmod 0440 "/etc/sudoers.d/${USERNAME}"

USER ${USERNAME}
WORKDIR /home/${USERNAME}

# Claude Code and Codex. Both installers are strictly per-user -- they unpack into
# $HOME and drop a launcher in ~/.local/bin -- so they run after the USER switch,
# not as root. Installing them as root would put the binaries in /root and leave
# `claude` not found for the student.
#
# Set PATH first: the installers write to ~/.local/bin, and Ubuntu's ~/.profile only
# adds that directory in a *login* shell. VS Code's integrated terminal and the
# extensions' own spawned processes are not login shells, so without this the
# binaries exist but nothing can find them.
ENV PATH=/home/${USERNAME}/.local/bin:${PATH}

# Kept as two layers so a bad release of one agent does not invalidate the other's
# cache. Each installer verifies its own download (Claude checks a SHA256 from the
# release manifest; Codex checks the release checksums), which is the reason for
# using them over hand-rolled tarball fetches.
RUN set -eux; \
    curl -fsSL https://claude.ai/install.sh | bash -s "${CLAUDE_CODE_VERSION}"; \
    claude --version

# CODEX_NON_INTERACTIVE stops the installer prompting about PATH edits and shell
# profiles -- there is no tty during a build, and PATH is already handled above.
RUN set -eux; \
    curl -fsSL https://github.com/openai/codex/releases/latest/download/install.sh \
        | CODEX_NON_INTERACTIVE=true sh -s -- --release "${CODEX_VERSION}"; \
    codex --version
