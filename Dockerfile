FROM python:3.10

ENV TELEGRAM_API_TOKEN=""
ENV TELEGRAM_ACCESS_ID=""

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY pip_requirements.txt ./pip_requirements.txt

RUN pip install -U pip \
        && pip install -r pip_requirements.txt \
        && apt-get update \
        && apt-get install sqlite3 \
        && apt-get clean

COPY . .

ENTRYPOINT ["python", "server.py"]

