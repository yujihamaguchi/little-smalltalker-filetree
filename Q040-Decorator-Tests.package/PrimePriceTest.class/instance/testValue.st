tests
testValue

	| value primePrice result |
	"Arrange"
	value := 11.
	primePrice := PrimePrice value: value.

	"Act"
	result := primePrice value.

	"Assert"
	self assert: result equals: value