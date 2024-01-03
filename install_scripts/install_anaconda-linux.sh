#!/usr/bin/env bash
prefix=$HOME/anaconda
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" -O anaconda.sh
chmod +x anaconda.sh
./anaconda.sh -b -p $prefix
rm anaconda.sh
export PATH=$prefix/bin:$PATH

source "${prefix}/etc/profile.d/conda.sh"
# For mamba support also run the following command
source "${prefix}/etc/profile.d/mamba.sh"

conda activate
mamba update --all
