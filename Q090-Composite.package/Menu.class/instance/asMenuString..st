printing
asMenuString: aDepthNumber

	^ (self indent: aDepthNumber) , (self emphasizedTitle: self title)
	  , ((menuComponents collect: [ :each | 
			    each asMenuString: aDepthNumber + 1 ]) joinUsing: String cr)