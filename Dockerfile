# syntax=docker/dockerfile:1

FROM python:3.6

RUN apt-get update -y \
    && apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev libsnmp-dev

LABEL Maintainer="gesiellucas"

WORKDIR /usr/app/src

COPY test.py ./

ENTRYPOINT ["tail", "-f", "/dev/null"]

COPY requirements.txt requirements.txt

RUN /usr/local/bin/python -m pip install --upgrade pip

RUN pip install -r requirements.txt

# COPY . .

# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
