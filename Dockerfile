From python:3.8
COPY . /app
WORKDIR /app
RUN set -xe \
    && apk add --update py3-pip
RUN apk update
RUN apk add make automake gcc g++ subversion python3-dev
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
