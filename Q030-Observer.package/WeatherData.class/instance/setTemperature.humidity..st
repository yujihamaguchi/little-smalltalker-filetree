accessing
setTemperature: aTemperatureNumber humidity: aHumidityNumber

	temperature := aTemperatureNumber.
	humidity := aHumidityNumber.
	self notifyObservers