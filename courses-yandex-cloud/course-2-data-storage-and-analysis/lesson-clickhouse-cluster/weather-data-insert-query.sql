cat weather_data.tsv | clickhouse-client \
--host <адрес вашей БД> \
--secure \
--user user1 \
--database db1 \
--port 9440 \
-q "INSERT INTO <DB-name>.Weather FORMAT TabSeparated" \
--ask-password
