FROM python:3.7.3-stretch

# Working Directory
WORKDIR /app

# Argument Version number passed at build time
ARG CONT_IMG_VER=0
ENV VER = ${CONT_IMG_VER}

# Copy source code to working directory
COPY ./App/ /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 80
EXPOSE 8080

# Run app.py at container launch
ENTRYPOINT [ "python" ]
CMD [ "app.py", ${VER}]
