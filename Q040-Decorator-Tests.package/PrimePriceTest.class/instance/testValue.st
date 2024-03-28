tests
testValue

	| value primePrice result |
	"Arrange"
	value := 3.
	primePrice := PrimePrice value: value.

	"Act"
	result := primePrice value.

	"Assert"
	self assert: result equals: value