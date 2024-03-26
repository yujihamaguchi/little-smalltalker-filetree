tests
testValue

	| primePrice doublePrice result |
	"Arrange"
	primePrice := PrimePrice value: 10.
	doublePrice := DoublePrice price: primePrice.

	"Act"
	result := doublePrice value.

	"Assert"
	self assert: result equals: 20