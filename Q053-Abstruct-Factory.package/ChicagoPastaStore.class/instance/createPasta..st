as yet unclassified
createPasta: aSymbol
	^ #Cheese = aSymbol
		  ifTrue: [ ChicagoCheesePasta new ]
		  ifFalse: [ nil ]