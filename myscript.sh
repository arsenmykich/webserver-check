#!/bin/bash

# Задаємо URL веб-сервера, який перевірятимемо
url="http://webserver"

# Виконуємо запит до веб-сервера та отримуємо код відповіді
status=$(curl -s -o /dev/null -w "%{http_code}" $url)

# Перевіряємо, чи код відповіді не 2хх або 3хх
if [[ "$status" != 2* && "$status" != 3* ]]; then
    # Записуємо повідомлення про помилку в лог-файл
    echo "$(date) - HTTP status $status" >> /var/log/server-check.log
fi