printing
asPrintingString: aDepthNumber

	^ (self titleForPrinting: aDepthNumber)
	  , (self subComponentsForPrinting: aDepthNumber + 1)