tests
testCreateSushi

	| target ikura |
	target := SimpleSushiFactory new.
	ikura := Ikura new. 

	self assert: (target createSushi: #Ikura) class equals: ikura class.

	self assert: (target createSushi: #Karasumi) equals: nil