tests
testBetweenAnd
	| target result |
	"Arrange"
	target := ServiceCharges new.
	target at: 1 put: Mock new.
	target at: 2 put: Mock new.
	target at: 3 put: Mock new.
	target at: 4 put: Mock new.
	target at: 5 put: Mock new.
	
	"Act"
	result := target between: 2 and: 4.
	 
	"Assert"
	self assert: result dates asSet equals: #( 2 3 4 ) asSet