

all: download build train 


download: download_arctic

download_arctic:
	bash ./data/cmu_arctic/download.sh


build:
	docker build -t wavenet-pytorch -f Dockerfile .

run:
	nvidia-docker run --rm -v $$(pwd):/workspace -v "/mnt/moria/datasets/speech/":/data -it wavenet-pytorch bash


data_arctic_pre: 
	python preprocess.py cmu_arctic /data/cmu_arctic /data/cmu_arctic_pre
