#!/bin/sh
# Query the linker version
ld -v || true

# Query the (g)libc version
ldd --version || true

echo ""
echo "build requires linking against ncurses AND tinfo, run the following before compilation:"
echo "export LDFLAGS=\"-ltinfo -lncurses\""

emerge-webrsync
emerge \
 bash \
 dev-lang/nasm \
 dev-libs/libaio \
 dev-libs/openssl \
 dev-python/pip \
 dev-python/pyelftools \
 dev-util/cunit \
 dev-util/meson \
 dev-util/pkgconf \
 dev-vcs/git \
 findutils \
 make \
 patch \
 sys-libs/liburing \
 sys-libs/ncurses \
 sys-process/numactl

# Install packages via the Python package-manager (pip)
python3 -m pip install --break-system-packages --upgrade pip
python3 -m pip install --break-system-packages \
 pipx

