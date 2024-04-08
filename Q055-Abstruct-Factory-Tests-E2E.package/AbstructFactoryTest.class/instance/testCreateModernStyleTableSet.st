tests
testCreateModernStyleTableSet

	| modernStyleFactory target |
	"Arrange"
	modernStyleFactory := ModernStyleFactory new.
	target := FurnitureStudio factory: modernStyleFactory.

	"Act"
	target createTableSet.

	"Assert"
	self assert: target chair class equals: MordernChair.
	self assert: target table class equals: MordernTable.
	self assert: target bench class equals: MordernBench