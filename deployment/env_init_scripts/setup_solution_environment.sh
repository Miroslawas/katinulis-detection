#!/usr/bin/env bash

# variable initialization
project_name=katinulis-detection
venv_root_folder=virtual-environments
venv_path=$1/${venv_root_folder}/${project_name}
data_path=$1/datasets/${project_name}

# setting up folder structure
mkdir -p ${data_path}
mkdir -p ${data_path}/patterns
mkdir -p ${venv_path}

echo "virtual environment path"
echo ${venv_path}
echo "datasets path"
echo ${data_path}
echo "export KATINULIS_DETECTION_DATA_PATH=${data_path}" >> ~/.bash_rc

touch "${data_path}/runtimes.csv"

source ~/.bash_rc

# creating venv with required packages
virtualenv -p python3 ${venv_path}
source ${venv_path}/bin/activate
pip install -r requirements.txt
