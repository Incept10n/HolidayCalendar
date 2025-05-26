FROM python:3.13.3-alpine3.21

WORKDIR /fastapiback

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD [ "fastapi", "run" ]