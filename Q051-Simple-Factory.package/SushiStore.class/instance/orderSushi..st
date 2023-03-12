as yet unclassified
orderSushi: aSymbol
	| sushi |
	sushi := sushiFactory createSushi: aSymbol.
	^ sushi prepare box