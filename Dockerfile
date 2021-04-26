FROM amazon/aws-glue-libs:glue_libs_1.0.0_image_01

RUN pip install jupyterlab
RUN pip install iplantuml

COPY jupyter_start.sh /home/jupyter
RUN chmod 775 /home/jupyter/jupyter_start.sh

ENV PATH $PATH:/home/aws-glue-libs/bin/:/usr/share/maven/bin:${SPARK_HOME}/bin/
ENV PYTHONPATH $PYTHONPATH:/home/jupyter/jupyter_default_dir
ENV PYSPARK_PYTHON_DRIVER jupyter
ENV PYSPARK_DRIVER_PYTHON jupyter
ENV PYSPARK_DRIVER_PYTHON_OPTS ' lab --allow-root --NotebookApp.token="" --NotebookApp.password="" --no-browser --ip=0.0.0.0'

RUN mkdir ~/.aws
COPY aws/config /root/.aws
RUN chmod 600  ~/.aws/config
COPY aws/credentials /root/.aws
RUN chmod 600  ~/.aws/credentials
