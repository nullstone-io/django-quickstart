FROM nullstone/django

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
