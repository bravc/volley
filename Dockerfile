FROM python:3.8.16-alpine3.16

WORKDIR /app

ADD requirements.txt ./

RUN pip install -r requirements.txt

ADD . .

EXPOSE 2020
ENTRYPOINT [ "gunicorn", "--workers=2", "--bind=0.0.0.0:2020", "run:app" ]