tests
testArrivalDate

	| customer arrivalDate supplierAdapter aDate |
	"Arrange"
	customer := Customer new.
	supplierAdapter := Mock new.
	aDate := Mock new.
	supplierAdapter stub arrivalDate willReturn: aDate.
	customer supplierAdapter: supplierAdapter.

	"Act"
	arrivalDate := customer arrivalDate.

	"Assert"
	self assert: arrivalDate equals: aDate