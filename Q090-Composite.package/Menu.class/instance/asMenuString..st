printing
asMenuString: aDepthNumber

	^ (aDepthNumber = 0
		   ifTrue: String cr
		   ifFalse: '') , (' ' repeat: aDepthNumber * 2) , '[' , self title
	  , ']' , String cr , ((menuComponents collect: [ :each | 
		    each asMenuString: aDepthNumber + 1 ]) joinUsing: String cr)