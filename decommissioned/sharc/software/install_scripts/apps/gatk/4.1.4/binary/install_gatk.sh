mkdir /usr/local/packages/apps/gatk/4.1.4/binary
cd /usr/local/packages/apps/gatk/4.1.4/binary
wget https://github.com/broadinstitute/gatk/releases/download/4.1.4.0/gatk-4.1.4.0.zip
unzip gatk-4.1.4.0.zip
cd gatk-4.1.4.0
cp -r * ../
cd ../
rm -r gatk-4.1.4.0 
