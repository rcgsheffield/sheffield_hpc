#!/bin/bash
# Install CUDA on the ShARC cluster

# Signal handling for failure
handle_error () {
    errcode=$?
    echo "Error code: $errcode" 
    echo "Errored command: " echo "$BASH_COMMAND" 
    echo "Error on line: ${BASH_LINENO[0]}"
    exit $errcode
}
trap handle_error ERR
set -u


VERSIONS=(
    11.1.1_455.32.00
    11.0.2_450.51.05
    11.0.2_450.51.05
    10.2.89_440.33.01
    10.1.243_418.87.00
    10.0.130_410.48
    9.1.85_387.26
    9.0.176_384.81
    8.0.44
    7.5.18
)
MEDIA_DIR='/usr/local/media/nvidia/'

usage () {
    ( IFS='|'; echo "Usage: $0 [${VERSIONS[*]}]" 1>&2 )
}

if [ "$#" -ne 1 ]; then
    usage
    exit 1
fi

# Check for valid version string
# (should be CUDA version + driver version in the form 11.22.33_44.55.66
#  or for older CUDAs just the CUDA version in the form 11.22.33)
if [[ ! "$1" =~ [0-9]+\.[0-9]+\.[0-9]+(_[0-9]+\.[0-9]+\.[0-9]+)? ]]; then
    usage
    exit 1
fi

# Check if requested version is supported
if [[ ! " ${VERSIONS[@]} " =~ " $1 " ]]; then
    # CUDA version not supplied as 1st command-line argument  
    usage
    exit 1
fi
vers="$1"

# Unpack version string
read -r cuda_vers drv_vers <<<$(echo "$vers" | tr '_' ' ')
read -r cuda_vers_maj cuda_vers_min cuda_vers_patch <<<$(echo "${cuda_vers}" | tr '.' ' ')

pushd $MEDIA_DIR

if [[ "${cuda_vers_maj}" -ge 9 ]]; then
    echo "Checking validity of installers using checksums from NVIDIA site"
    md5sum --check $MEDIA_DIR/cuda-${cuda_vers}-md5sums.txt
    rc=$?
    if [[ $rc != 0 ]]; then 
        echo 1>&2 "Could not validate MD5 checksums of CUDA ${cuda_vers} installer or patches; exiting."
        exit $rc;
    fi
fi

installer="${MEDIA_DIR}/cuda_${vers}_linux.run"
if [[ $cuda_vers =~ ^9.0[^0-9] ]]; then
    installer="$MEDIA_DIR/cuda_${vers}_linux-run"
fi
chmod +x "$installer"

prefix="/usr/local/packages/libs/CUDA/${cuda_vers}/binary"
echo "Installing to ${prefix}..."
mkdir -m 2775 -p "${prefix}"
chown -R ${USER}:hpc_app-admins "${prefix}"
chmod -R g+w "$prefix"

echo "Installing CUDA using $installer"
if [[ $cuda_vers_maj -eq 10 ]] && [[ $cuda_vers_min -ge 1 ]] || [[ $cuda_vers_maj -ge 11 ]]; then
    # The installer changed a bit with 10.1
    # The logic for this version and more recent version is now partly based on the EasyBuild recipe
    pushd ${TMPDIR-/tmp}
    /bin/sh "$installer" --noexec --nox11 --target .
    export LANG=C
    unset DISPLAY
    rm -f /tmp/cuda-installer.log
    ./cuda-installer --silent --toolkit --installpath="$prefix" --no-opengl-libs 
    ./cuda-installer --silent --samples --installpath="$prefix"
    /usr/sbin/ldconfig -N "${prefix}/lib64/stubs"
    popd
else
    /bin/sh $installer \
        --toolkit --toolkitpath=${prefix}/cuda \
        --samples --samplespath=${prefix}/samples \
        --no-opengl-libs \
        --silent
fi

# Apply patches (CUDA 9.0 and CUDA 9.1)
if [[ $cuda_vers_maj -eq 9 ]] && [[ $cuda_vers_min =~ [01] ]]; then
    for p in 1 2 3; do 
        patch_file="$MEDIA_DIR/cuda_${cuda_vers}.${p}_linux.run"
        echo "Applying CUDA_related patch $patch_file"
        chmod +x $patch_file
        $patch_file \
           --silent \
           --accept-eula \
           --installdir=${prefix}/cuda
    done 
fi
