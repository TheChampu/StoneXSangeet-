FROM nikolaik/python-nodejs:python3.10-nodejs20

RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg aria2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/
RUN python -m pip install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

CMD bash start
