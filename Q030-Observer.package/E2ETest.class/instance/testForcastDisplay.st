tests
testForcastDisplay

	| subject observer |
	"Rule: The observers should not be dependent on the subject"
	subject := WeatherData new.

	observer := ForecastDisplay subject: subject.

	subject setTemperature: 1 humidity: 2.
	self
		assert: observer display
		equals: 'Forecast / temperature: 1, humidity: 2'.

	subject setTemperature: 4 humidity: 5.
	self
		assert: observer display
		equals: 'Forecast / temperature: 4, humidity: 5'