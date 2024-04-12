tests
testCreateSushi

	| target |
	"Arrange"
	target := SushiFactory new.

	"Act + Assert"
	self assert: (target createSushi: #Ikura) class equals: Ikura.
	self assert: (target createSushi: #Norimaki) class equals: Norimaki