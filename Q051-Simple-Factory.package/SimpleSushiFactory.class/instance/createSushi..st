as yet unclassified
createSushi: aSymbol
	^ aSymbol = #Ikura ifTrue: [ Ikura new ] ifFalse: [ nil ]
