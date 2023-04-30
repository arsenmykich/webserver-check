#!/bin/bash

# Задаємо URL веб-сервера, який перевірятимемо
url="http://webserver"

#echo "Hello" >> server-check.log
# Виконуємо запит до веб-сервера та отримуємо код відповіді
status=$(curl -s -o /dev/null -w "%{http_code}" $url)
# Перевіряємо, чи код відповіді не 2хх або 3х
if [[ "$status" != 2* && "$status" != 3* ]]; then
    # Записуємо повідомлення про помилку в лог-файл
    echo "$(date) - HTTP status $status" >> server-check.log
fi