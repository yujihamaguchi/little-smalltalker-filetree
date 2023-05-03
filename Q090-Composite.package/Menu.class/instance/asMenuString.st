printing
asMenuString
	^ (menuComponents collect: [ :each | each asMenuString ]) joinUsing: ', '