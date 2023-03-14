as yet unclassified
createPizza: aSymbol
	^ #Cheese = aSymbol
		  ifTrue: [ NYStyleCheesePizza new ]
		  ifFalse: [ nil ]