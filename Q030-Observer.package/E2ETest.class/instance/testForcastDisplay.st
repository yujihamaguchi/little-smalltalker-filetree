tests
testForcastDisplay
	| weatherData target |
	weatherData := WeatherData new initialize.

	target := ForecastDisplay subject: weatherData.

	weatherData setTemperature: 1 humidity: 2.
	self
		assert: target display
		equals: 'Forecast / temperature: 1, humidity: 2'.

	weatherData setTemperature: 4 humidity: 5.
	self
		assert: target display
		equals: 'Forecast / temperature: 4, humidity: 5'