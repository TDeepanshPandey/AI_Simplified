#!/bin/bash

echo "Starting setting up docker"
start=`date +%s`

########### Install package from apt-get
apt install -y git
git --version
echo -e "\n\n\n Apt Packages Install Complete \n\n\n"

################ Miniconda Setup
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash miniconda.sh
echo -e "\n\n\n Miniconda setup Complete \n\n\n"

############# Install Packages with pip 
yes | pip install spacy==2.1.6 
yes | pip install neo4j==1.7.2 
yes | pip install ijson 
echo -e "\n\n\n Pip Packages Install Complete \n\n\n"

#####
end=`date +%s`
echo "Setup Complete"
runtime=$((end-start))
echo -e "\n\n\nTotal running time in minutes : $(($runtime/60)) \n\n\n"
