FROM ubuntu:20.04

# Оновлюємо пакети та встановлюємо потрібні пакети
#RUN apt-get update && \
 #   apt-get install -y curl && \
  #  rm -rf /var/lib/apt/lists/*

# Копіюємо bash скрипт до образу


COPY myscript.sh /usr/local/bin/server-check.sh

# Встановлюємо права на виконання для bash скрипту
RUN chmod +x /usr/local/bin/server-check.sh

# Копіюємо конфігураційний файл лог-файлу до образу
COPY server-check.log /var/log/server-check.log

# Запускаємо bash скрипт при старті контейнера
CMD while true; do /usr/local/bin/myscript.sh; sleep 30; done;
