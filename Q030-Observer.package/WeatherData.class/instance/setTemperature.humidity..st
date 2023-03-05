initialization
setTemperature: aTemperatureNumber humidity: aHumidityNumber
	observers do: [ :each | each setTemperature: aTemperatureNumber humidity: aHumidityNumber ]
	