as yet unclassified
createPasta: aSymbol
	^ #Cheese = aSymbol
		  ifTrue: [ NYStyleCheesePasta new ]
		  ifFalse: [ nil ]