tests
testValue

	| price wholesalePrice result |
	"Arrange"
	price := Mock new.
	price stub value willReturn: 2.
	wholesalePrice := WholesalePrice price: price advantage: 3.
	
	"Act"
	result := wholesalePrice value.
	
	"Assert"
	price should receive value.
	self assert: result equals: 5