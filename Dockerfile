FROM gcr.io/tensorflow/tensorflow:latest-gpu-py3



RUN apt-get update && apt-get install -y --no-install-recommends \
        vim \
        less \
        git \
        python3-tk

 COPY requirements.txt .
 RUN pip install wheel setuptools && \
     pip install -r requirements.txt && \
     pip install http://download.pytorch.org/whl/cu80/torch-0.3.0.post4-cp35-cp35m-linux_x86_64.whl && \
     pip install torchvision



RUN useradd -r -u 1006  cyrta
USER cyrta

WORKDIR /workspace
CMD ["bash"]

