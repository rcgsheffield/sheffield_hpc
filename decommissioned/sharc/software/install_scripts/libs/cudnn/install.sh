#!/bin/bash
#
# The script installs version(s) of cuDNN for version(s) of CUDA (>= 9 only) to the correct ShARC directory.
# The tarball and a .deb of samples can be downloaded from NVIDIA at https://developer.nvidia.com/cudnn
# and need to be saved in $MEDIA_DIR (see below).

set -e

usage() {
cat 1>&2 << EOF
Usage: $0 -d <cudnn_versions> -c <cuda_versions>
        
Install version(s) of cuDNN for version(s) of CUDA to the correct ShARC directory.
          
-h Display this usage information
-d Comma-separated list of cuDNN versions
-c Comma-separated list of CUDA versions
EOF
}

unset cudnn_versions
unset cuda_versions

while getopts hd:c: o; do
    case "$o" in
        d)      cudnn_versions=( "${OPTARG//,/ }" );;
        c)      cuda_versions=( "${OPTARG//,/ }" );;
        h)     usage
                exit 1;;
        \?)     usage
                exit 1;;
        : )     echo "Invalid option: $OPTARG requires an argument" 1>&2;;
    esac
done
shift $(( OPTIND - 1 ))
if [[ -z $cudnn_versions ]] || [[ -z $cuda_versions ]]; then
    usage
    exit 1
fi

MEDIA_DIR="/usr/local/media/protected/cuDNN"
PREFIX_BASE="/usr/local/packages/libs/cudnn"

for d in "${cudnn_versions[@]}"; do 
    d_maj=$(echo $d | cut -d. -f1)
    for c in "${cuda_versions[@]}"; do 
        c_maj_min=$(echo $c | cut -d. -f1,2)

        prefix="${PREFIX_BASE}/$d/binary-cuda-${c_maj_min}"
        if [[ -d $prefix ]]; then
            echo "Not installing cuDNN $d for CUDA $c as the directory $prefix already exists" 1>&2
            continue
        fi

        tarball="${MEDIA_DIR}/cudnn-${c_maj_min}-linux-x64-v${d}.tgz"
        if ! [[ -f "${tarball}" ]]; then 
            echo "${tarball} not found" 1>&2
            exit 1
        fi
        mkdir -p "$prefix"
        tar -C "$prefix" -xvzf "$tarball"

        # Install examples and user manual
        unpack_dir="$(mktemp -d)"
        examples_deb="${MEDIA_DIR}/libcudnn${d_maj}-samples_${d}-1+cuda${c_maj_min}_amd64.deb"
        if ! [[ -f "${examples_deb}" ]]; then
            examples_deb="${MEDIA_DIR}/libcudnn${d_maj}-doc_${d}-1+cuda${c_maj_min}_amd64.deb"
            if ! [[ -f "${examples_deb}" ]]; then 
                echo "${examples_deb} not found" 1>&2
                exit 1
            fi
        fi
        pushd "$unpack_dir"
        ar x "${examples_deb}"
        tar -Jxf data.tar.xz
        mv usr/{src,share} "${prefix}/cuda"
        popd

        chgrp -R hpc_app-admins "${prefix}"
        chmod -R g+w "${prefix}"
    done
done
