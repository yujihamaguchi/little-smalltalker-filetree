printing
titleForPrinting: aDepthNumber

	^ (self indent: aDepthNumber) , '[' , title , ']' , String cr