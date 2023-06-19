SELECT
    City,
    LocalDate,
    TempC
FROM s3(
	        'https://storage.yandexcloud.net/arhipov/weather_data.tsv',
		        'TSV',
			        'LocalDateTime DateTime, LocalDate Date, Month Int8, Day Int8, TempC Float32,Pressure Float32, RelHumidity Int32, WindSpeed10MinAvg Int32, VisibilityKm Float32, City String')
			ORDER BY TempC ASC
			LIMIT 1
