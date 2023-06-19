SELECT
    Year,
    msk.t - spb.t
FROM
(
	    SELECT
	        toYear(LocalDate) AS Year,
		        avg(TempC) AS t
			    FROM s3(
				        'https://storage.yandexcloud.net/arhipov/weather_data.tsv',
					        'TSV',
						        'LocalDateTime DateTime, LocalDate Date, Month Int8, Day Int8, TempC Float32,Pressure Float32, RelHumidity Int32, WindSpeed10MinAvg Int32, VisibilityKm Float32, City String')
						    WHERE City = 'Moscow'
						    GROUP BY Year
						    ORDER BY Year ASC
					) AS msk
					INNER JOIN
					(
						    SELECT
						        toYear(LocalDate) AS Year,
							        avg(TempC) AS t
								    FROM s3(
									        'https://storage.yandexcloud.net/arhipov/weather_data.tsv',
										        'TSV',
											        'LocalDateTime DateTime, LocalDate Date, Month Int8, Day Int8, TempC Float32,Pressure Float32, RelHumidity Int32, WindSpeed10MinAvg Int32, VisibilityKm Float32, City String')
											    WHERE City = 'Saint-Petersburg'
											    GROUP BY Year
											    ORDER BY Year ASC
										) AS spb ON msk.Year = spb.Year
