as yet unclassified
orderSushi: aSymbol

	| sushi |
	sushi := factory createSushi: aSymbol.
	^ sushi prepare box
