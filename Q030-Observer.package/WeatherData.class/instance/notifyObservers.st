notifying
notifyObservers

	observersWithInterestingProperties associationsDo: [ :each | 
		| observer properties |
		observer := each key.
		properties := each value.
		properties value do: [ :property | 
			#temperature = property ifTrue: [ observer updateTemperature: temperature ].
			#humidity = property ifTrue: [ observer updateHumidity: humidity ] ] ]