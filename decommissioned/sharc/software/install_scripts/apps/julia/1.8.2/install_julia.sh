cd /home/$USER/
mkdir install_julia
cd install_julia
wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.2-linux-x86_64.tar.gz
tar -xf julia-1.8.2-linux-x86_64.tar.gz

cd /usr/local/packages/apps
mkdir julia
cd julia
mkdir 1.8.2
cd 1.8.2
mkdir binary
cp -r /home/$USER/install_julia/julia-1.8.2/* .

# Allow everyone to execute and read all files in the directory
chmod 775 -R /usr/local/packages/apps/julia/1.8.2/binary