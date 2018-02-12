

all: build run 


download: download_arctic

download_arctic:
	bash ./data/cmu_arctic/download.sh


build:
	docker build -t wavenet-pytorch -f Dockerfile .

run:
	nvidia-docker run --rm -v $$(pwd):/workspace -v $$(pwd)/data:/data -it wavenet-pytorch bash


data_arctic_pre: 
	python3 preprocess.py cmu_arctic /data/cmu_arctic /data/cmu_arctic_pre


train:
	python3 train.py --data-root=/data/cmu_arctic_pre/  --hparams="cin_channels=-1,gin_channels=-1"
