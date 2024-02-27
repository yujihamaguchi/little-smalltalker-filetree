printing
asMenuString: aDepthNumber

	^ (self indentedTitle: aDepthNumber)
	  , ((menuComponents collect: [ :each | 
			    each asMenuString: aDepthNumber + 1 ]) joinUsing: String cr)