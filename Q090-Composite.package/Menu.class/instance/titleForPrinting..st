printing
titleForPrinting: aDepthNumber

	^ (self indentStringFor: aDepthNumber) , '[' , title , ']'
	  , String cr