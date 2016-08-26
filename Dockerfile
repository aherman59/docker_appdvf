# docker_appdvf
FROM python:3.4

MAINTAINER Antoine Herman <antoine.herman@cerema.fr>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN git clone https://github.com/aherman59/indvf.git
WORKDIR /usr/src/app/indvf 
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install django>=1.9.6
RUN mv db_init.sqlite3 db.sqlite3
RUN python manage.py migrate

VOLUME /home/data_dvf

EXPOSE 8000 5432
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
