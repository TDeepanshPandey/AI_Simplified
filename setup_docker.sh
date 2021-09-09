#!/bin/bash

echo "Starting setting up docker"
start=`date +%s`

########### Install package from apt-get
apt-get update
apt-get install -y screen
apt-get install -y vim
apt install -y git
git --version

################ Miniconda Setup
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash miniconda.sh
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/root/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
else
    if [ -f "/root/miniconda3/etc/profile.d/conda.sh" ]; then
		        . "/root/miniconda3/etc/profile.d/conda.sh"
    else
       export PATH="/root/miniconda3/bin:$PATH"
        fi
	fi
	unset __conda_setup
# <<< conda initialize <<<


############# Install Packages with pip 
pip uninstall -y tensorflow
yes | pip install tf-agents==0.5.0 
pip uninstall -y tensorflow-probability
yes | pip install tfp-nightly==0.11.0.dev20200716
yes | pip install spacy==2.1.6 
yes | pip install tensorflow==2.2.0
yes | pip install transformers
yes | pip install neo4j==1.7.2 
yes | pip install scikit-learn==0.21.2 
yes | pip install ijson 
yes | pip install torch==1.6.0 # while using models offline
yes | conda install -c anaconda cudatoolkit=10.1

############### CUDA Setup to 10.1 
apt update
add-apt-repository ppa:graphics-drivers
apt-key adv --fetch-keys  http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
bash -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
bash -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda_learn.list'
apt install -y libcudnn7

#####

end=`date +%s`
echo "Setup Complete"
runtime=$((end-start))
echo -e "\n\n\nTotal running time in minutes : $(($runtime/60)) "
