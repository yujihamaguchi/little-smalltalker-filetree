tests
testValue

	| wholesalePrice value primePrice doublePrice result |
	"Arrange"
	primePrice := PrimePrice value: 10.
	doublePrice := DoublePrice price: primePrice.
	wholesalePrice := WholesalePrice price: doublePrice advantage: 15.
	doublePrice := DoublePrice price: wholesalePrice.
	result := doublePrice value.

	"Act"
	value := wholesalePrice value.

	"Assert"
	self assert: value equals: 70