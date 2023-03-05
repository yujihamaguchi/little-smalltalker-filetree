tests
testStatisticDisplay
	| weatherData target |
	weatherData := WeatherData new initialize.

	target := StatisticDisplay weatherData: weatherData.

	weatherData setTemperature: 1 humidity: 2.
	self
		assert: target display
		equals: 'Statistic / temperature: 1 is Good!'.

	weatherData setTemperature: 4 humidity: 5.
	self
		assert: target display
		equals: 'Statistic / temperature: 4 is Good!'