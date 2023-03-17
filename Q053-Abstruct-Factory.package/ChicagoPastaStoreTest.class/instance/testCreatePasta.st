tests
testCreatePasta
	| target |
	target := ChicagoPastaStore new.
	self
		assert: (target createPasta: #Cheese) class
		equals: ChicagoCheesePasta.
	self assert: (target createPasta: #Karasumi) equals: nil