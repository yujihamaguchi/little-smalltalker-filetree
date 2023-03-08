tests
testStatisticAnalyze

	| weatherData target |
	weatherData := WeatherData new initialize.

	target := StatisticAnalyze subject: weatherData.

	weatherData setTemperature: 1 humidity: 2.
	self
		assert: target analyze
		equals: 'Statistic / temperature: 1 is Good!'.

	weatherData setTemperature: 4 humidity: 5.
	self
		assert: target analyze
		equals: 'Statistic / temperature: 4 is Good!'