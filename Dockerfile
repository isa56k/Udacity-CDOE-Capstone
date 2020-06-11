FROM python:3.7.3-stretch

# Working Directory
WORKDIR /app

# Argument Version number passed at build time
ARG CONT_IMG_VER=0

# Copy source code to working directory
COPY ./App/ /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 80
EXPOSE 8080

# Run app.py at container launch
CMD ["python", "app.py","999"]