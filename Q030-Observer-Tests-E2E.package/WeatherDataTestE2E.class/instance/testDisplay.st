tests
testDisplay

	| observer1 observer2 subject temperature humidity |
	"Arrange"
	subject := WeatherData new.
	observer1 := ForecastDisplay subject: subject.
	observer2 := StatisticAnalyze subject: subject.

	"Act"
	temperature := 10.
	humidity := 2.
	subject setTemperature: temperature humidity: humidity.

	"Assert"
	self
		assert: observer1 display
		equals: ('Forecast / temperature: {1}, humidity: {2}' format: { 
					 temperature.
					 humidity }).
	self
		assert: observer2 analyze
		equals:
		('Statistic / temperature: {1} is cold!' format: { temperature }).

	"Act"
	temperature := 20.
	humidity := 4.
	subject setTemperature: temperature humidity: humidity.

	"Assert"
	self
		assert: observer1 display
		equals: ('Forecast / temperature: {1}, humidity: {2}' format: { 
					 temperature.
					 humidity }).
	self
		assert: observer2 analyze
		equals:
		('Statistic / temperature: {1} is warm!' format: { temperature })