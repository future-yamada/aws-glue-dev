FROM amazon/aws-glue-libs:glue_libs_1.0.0_image_01

RUN pip install jupyterlab
RUN pip install iplantuml

COPY jupyter_start.sh /home/jupyter

RUN chmod 775 /home/jupyter/jupyter_start.sh
ENV PATH $PATH:/home/aws-glue-libs/bin/
RUN echo $PATH
ENV PYTHONPATH $PYTHONPATH:/home/jupyter/jupyter_default_dir