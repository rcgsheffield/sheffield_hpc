#note large memory required for build hence use /fastdata
mkdir /fastdata/$USER/clang_install
cd /fastdata/$USER/clang_install
git clone https://github.com/llvm/llvm-project.git
cd llvm-project
mkdir build
cd build
module load dev/cmake/3.17.1/gcc-8.2
cmake -DCMAKE_INSTALL_PREFIX=/usr/local/packages/dev/clang/10.0.0/gcc-8.2/ -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" ../llvm
make
make install
