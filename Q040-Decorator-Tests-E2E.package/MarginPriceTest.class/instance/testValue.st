tests
testValue

	| wholesalePrice primePrice doublePrice result |
	"Arrange"
	primePrice := PrimePrice value: 3.
	doublePrice := DoublePrice price: primePrice.
	wholesalePrice := WholesalePrice price: doublePrice advantage: 7.
	doublePrice := DoublePrice price: wholesalePrice.

	"Act"
	result := doublePrice value.

	"Assert"
	self assert: result equals: 26