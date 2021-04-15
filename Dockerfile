FROM continuumio/anaconda3:latest

LABEL maintainer="Krzysztof Bruszewski <krzysztof.bruszewski@gmail.com>"

RUN apt update -y \
&& apt -y install graphviz \
&& apt -y install ffmpeg libsm6 libxext6

# Updating Anaconda packages
RUN conda update conda -y \
&& conda update anaconda -y \
&& conda update --all -y \
&& python -m pip install --upgrade pip

# Installing additional libraries
RUN pip install psycopg2-binary \
&& pip install tensorflow \
&& pip install keras

RUN conda install -y -c conda-forge dill \
&& conda install -y -c conda-forge python-graphviz \
&& conda install -y -c conda-forge shap \
&& conda install -y -c conda-forge imbalanced-learn=0.5.0 \
&& conda install -y -c conda-forge category_encoders \
&& conda install -y -c conda-forge pingouin \
&& conda install -y -c conda-forge tabulate \
&& conda install -y -c conda-forge pydotplus \
&& conda install -y -c conda-forge rsa \
&& conda install -y -c conda-forge opencv \
&& conda install -y -c conda-forge jellyfish \
&& conda install -y -c conda-forge spacy \
&& conda install -y -c conda-forge pyod \
&& conda install -y -c conda-forge plotly \
&& conda install -y -c conda-forge py-xgboost \
&& conda install -y -c conda-forge lightgbm \
&& conda install -y -c conda-forge geopy

# Creating a directory for Jupyter Notebooks
RUN mkdir -p /home/notebooks

WORKDIR /home/notebooks

# Jupyter listens port: 8888
EXPOSE 8888

# Run Jupytewr Notebook
CMD jupyter notebook --notebook-dir=/home/notebooks --ip='*' --port 8888 --no-browser --allow-root