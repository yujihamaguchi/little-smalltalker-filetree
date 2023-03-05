as yet unclassified
weatherData: aSubject
	| forecastDisplay |
	forecastDisplay := self new.
	aSubject addObserver: forecastDisplay.
	^ forecastDisplay