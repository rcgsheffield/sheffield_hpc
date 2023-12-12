#!/bin/bash
# Install Magma 2.24 on ShARC

# Error handling setup
set -o errexit
set -o nounset
set -o errtrace
set -o functrace
set -o pipefail
failure() {
  local lineno=$1
  local msg=$2
  echo "Failed at $lineno: $msg"
}
trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

readonly MAGMA_VERS=2.24

# Installation media and checksums
readonly AVX64_GZIPPED_SHA256='387a7df9153c039bc30aab5ce70cd1eaba48a314a0778e9e46317d3f49252fbb'
readonly AVX64_GZIPPED="${HOME}/magma.avx64.exe.gz"
readonly CUDA8_GZIPPED="${HOME}/magma.cuda8.exe.gz"
readonly CUDA8_GZIPPED_SHA256='a90f613c4eba571e59b5d5d7c2a78114c2e794bc9e0e8b54c276e7cab49dca32'
readonly SHARED_TARBALL="${HOME}/shared_complete.tar.gz"
readonly SHARED_TARBALL_SHA256='0f0ea91b3f36a84f0bb2bae719c81e97d18aa4254daed9384372ac505376f006'
# Check checksums
sha256sum "${AVX64_GZIPPED}" | grep -qw "${AVX64_GZIPPED_SHA256}"
sha256sum "${CUDA8_GZIPPED}" | grep -qw "${CUDA8_GZIPPED_SHA256}"
sha256sum "${SHARED_TARBALL}" | grep -qw "${SHARED_TARBALL_SHA256}"

# Create installation prefixes (for AVX64 and CUDA8)
readonly BASE_PKG_PREFIX='/usr/local/community/rse/pkgs'
readonly PREFIX_AVX64="${BASE_PKG_PREFIX}/apps/magma/${MAGMA_VERS}/binary-avx64"
readonly PREFIX_CUDA8="${BASE_PKG_PREFIX}/apps/magma/${MAGMA_VERS}/binary-cuda8"
mkdir -p "${PREFIX_AVX64}" "${PREFIX_CUDA8}"
chmod -R ug+rwX "${PREFIX_AVX64}" "${PREFIX_CUDA8}"

# Extract the Magma executables (for AVX64 and for CUDA8)
zcat "${AVX64_GZIPPED}"  > "${PREFIX_AVX64}/magma.exe"
zcat "${CUDA8_GZIPPED}" > "${PREFIX_CUDA8}/magma.exe"

chmod +x "${PREFIX_AVX64}/magma.exe" "${PREFIX_CUDA8}/magma.exe"

for prefix in "${PREFIX_AVX64}/" "${PREFIX_CUDA8}/"; do
    # Extract the Magma components common to the AVX64 and CUDA8 builds
    tar -zxpf "${SHARED_TARBALL}" -C "$prefix" 
    # Set Magma ROOT path in magma startup script
    sed -i "s%^ROOT=.*%ROOT=\"${PREFIX_AVX64}\"%" "${prefix}/magma"
    chmod +x "${prefix}/magma"
done

# Modulefile config
readonly BASE_MOD_PREFIX='/usr/local/community/rse/mods'
readonly MODFILE_AVX64="${BASE_MOD_PREFIX}/apps/magma/${MAGMA_VERS}/binary-avx64"
readonly MODFILE_CUDA8="${BASE_MOD_PREFIX}/apps/magma/${MAGMA_VERS}/binary-cuda8"
mkdir -p "$(dirname "${MODFILE_AVX64}")" "$(dirname "${MODFILE_CUDA8}")"

echo "Now create the modulefiles at:"
echo "  - ${MODFILE_AVX64}"
echo "  - ${MODFILE_CUDA8}"

echo "And create/update the 'magmapassfile' license file at:"
echo " - ${PREFIX_AVX64}/magmapassfile"
echo " - ${PREFIX_CUDA8}/magmapassfile"
