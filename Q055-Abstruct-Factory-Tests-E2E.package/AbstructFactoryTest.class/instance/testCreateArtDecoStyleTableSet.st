tests
testCreateArtDecoStyleTableSet

	| modernStyleFactory target |
	"Arrange"
	modernStyleFactory := ArtDecoStyleFactory new.
	target := FurnitureStudio factory: modernStyleFactory.

	"Act"
	target createTableSet.

	"Assert"
	self assert: target chair sit equals: 'sit on the art deco chair'.
	self assert: target table stand equals: 'stand on the art deco table'.
	self assert: target bench lie equals: 'lie on the art deco bench'