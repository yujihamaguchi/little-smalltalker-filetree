as yet unclassified
subComponentsForPrinting: aDepthNumber

	^ (menuComponents collect: [ :c | c asPrintingString: aDepthNumber ]) 
		  joinUsing: String cr