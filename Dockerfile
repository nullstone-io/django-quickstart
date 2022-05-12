FROM nullstone/django

ENV WSGI_APP app.wsgi:application

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
