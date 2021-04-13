# Use base image with python
FROM ubuntu:20.04

# Define environment variable
ENV BRANCH="mysql"

RUN apt-get update && apt-get install unzip

# Download and unpack source code
# In a real project you'll use `ADD ./src`

RUN apt-get install -y python3
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y python3-pip python3-django
# Make /app working directory

ADD https://github.com/allburov/django-helloworld/archive/${BRANCH}.zip /tmp/app.zip

RUN unzip /tmp/app.zip -d /tmp/app && \
    mv /tmp/app/django-helloworld-${BRANCH} /app
# Install dependencies

WORKDIR /app
RUN pip install -r requirements.txt

# Share port
EXPOSE 8000

# Command to run project
CMD python3 manage.py migrate && \
    python3 manage.py runserver 0.0.0.0:8000 --noreload
