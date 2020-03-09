FROM continuumio/anaconda3

RUN conda install -y tensorflow-gpu
RUN conda install -y keras-gpu
RUN conda install -y pytorch-gpu
RUN conda install -y torchvision
#RUN conda install -y caffe-gpu
RUN conda install -y py-xgboost-gpu
RUN conda install -c conda-forge ipython-autotime
#RUN conda install -c r r-irkernel
#RUN conda install -y r-essentials r-base
RUN conda update --all
RUN pip install sdeint
RUN pip install optuna
RUN pip install ddeint
RUN pip install nnabla-ext-cuda101

WORKDIR /workdir
EXPOSE 8888
ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

CMD ["--notebook-dir=/workdir"]

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES utility,compute
