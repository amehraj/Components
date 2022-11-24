# define the version of Python here
FROM python:3.7.9
LABEL org.opencontainers.image.source https://github.com/simcesplatform/user-component
LABEL org.opencontainers.image.description "Docker image for the user-component for the SimCES platform."

# create the required directories inside the Docker image
RUN mkdir -p /user_component
RUN mkdir -p /init
RUN mkdir -p /logs
RUN mkdir -p /simulation-tools

# install the python libraries inside the Docker image
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

# copy the required directories with their content to the Docker image
COPY user_component/ /user_component/
COPY init/ /init/
COPY simulation-tools/ /simulation-tools/

# set the working directory inside the Docker image
WORKDIR /

# start command that is run when a Docker container using the image is started

CMD [ "python3", "-u", "-m", "user_component.user_component" ]