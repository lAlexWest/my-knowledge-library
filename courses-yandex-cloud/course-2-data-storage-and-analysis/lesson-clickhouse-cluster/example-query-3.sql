SELECT
    City,
    toYear(LocalDate) AS year,
    MIN(LocalDate)
FROM
(
	    SELECT
	        City,
		        LocalDate,
			        windowFunnel(864000)(LocalDateTime, TempC >= 15, TempC >= 15, TempC >= 15, TempC >= 15, TempC >= 15) AS warmdays
				    FROM s3(
					        'https://storage.yandexcloud.net/arhipov/weather_data.tsv',
						        'TSV',
							        'LocalDateTime DateTime, LocalDate Date, Month Int8, Day Int8, TempC Float32,Pressure Float32, RelHumidity Int32, WindSpeed10MinAvg Int32, VisibilityKm Float32, City String')
							    GROUP BY
							        City,
								        LocalDate
								)
								WHERE warmdays = 5
								GROUP BY
								    year,
								    City
								ORDER BY
								    year ASC,
								    City ASC
