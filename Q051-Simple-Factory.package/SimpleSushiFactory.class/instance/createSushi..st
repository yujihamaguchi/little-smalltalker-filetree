as yet unclassified
createSushi: aSymbol
	^ #Ikura == aSymbol
		  ifTrue: [ Ikura new ]
		  ifFalse: [ nil ]