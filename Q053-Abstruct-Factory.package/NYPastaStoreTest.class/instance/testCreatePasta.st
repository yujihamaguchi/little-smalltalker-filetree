tests
testCreatePasta
	| target |
	target := NYPastaStore new.
	self
		assert: (target createPasta: #Cheese) class
		equals: NYStyleCheesePasta.
	self assert: (target createPasta: #Karasumi) equals: nil