FROM python:3.7-slim


RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free" > /etc/apt/sources.list

RUN apt-get update && apt-get install --no-install-recommends -y \
    # General library compilation
    gcc \ 
    # Kerberos headers for pyspark
    libkrb5-dev \ 
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN  mkdir /root/.pip
COPY pip.conf  /root/.pip

RUN pip install jupyter pyspark sparkmagic

RUN cd /usr/local/lib/python3.7/site-packages \
    && jupyter-kernelspec install sparkmagic/kernels/pysparkkernel

RUN useradd notebook && mkdir /home/notebook
RUN mkdir /workbooks/ \
    && mkdir /home/notebook/.jupyter/ \
    && mkdir /home/notebook/.sparkmagic/ \
    && mkdir /home/notebook/.jupyter/custom
COPY ./jupyter_notebook_config.py /home/notebook/.jupyter/
COPY ./config.json /home/notebook/.sparkmagic/
COPY ./custom.css /home/notebook/.jupyter/custom/

RUN chown -R notebook:notebook /home/notebook
RUN chown -R notebook:notebook /workbooks/
USER notebook
WORKDIR /home/notebook

CMD ["jupyter", "notebook"]