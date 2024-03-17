FROM python:3.9

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install Pillow
RUN pip install psycopg2
COPY . .
#RUN python manage.py migrate
EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "backend.wsgi:application"] 
