from python:3.11
Run apt update && apt install pip -y
WORKDIR /usr/build
COPY requirement.txt  .
RUN pip install -r requirement.txt --use-pep517 --user
WORKDIR /usr/app
COPY static/ static/
COPY templates/ templates/
COPY app.py .
COPY liens.json .

EXPOSE 5000

CMD ["python", "-m", "flask","run","--host=0.0.0.0"]