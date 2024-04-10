tests
testCreateModernStyleTableSet

	| modernStyleFactory target |
	"Arrange"
	modernStyleFactory := ModernStyleFactory new.
	target := FurnitureStudio factory: modernStyleFactory.

	"Act"
	target createTableSet.

	"Assert"
	self assert: target chair sit equals: 'sit on the modern chair'.
	self assert: target table stand equals: 'stand on the modern table'.
	self assert: target bench lie equals: 'lie on the modern bench'