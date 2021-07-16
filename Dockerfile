FROM ubuntu
FROM python:3.6
#Install packages
RUN apt-get -y update
RUN apt install -y libgdal-dev
RUN apt-get install -y build-essential python3-pip
RUN python3.6 -m pip install pip --upgrade
ENV PYTHONUNBUFFERED=1
WORKDIR /home/divum/Poultry/Poultry
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN pip3 install gunicorn
COPY . .
EXPOSE 8000
CMD ["gunicorn","--preload","--bind","0.0.0.0:8080","--workers","5","Poultry.wsgi:application"]
