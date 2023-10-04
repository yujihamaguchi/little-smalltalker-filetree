accessing
testTotalAmount

	| target result serviceCharge1 serviceCharge2 expected |
	"Arrange"
	target := ServiceCharges new.
	
	serviceCharge1 := Mock new.
	serviceCharge1 stub amount willReturn: 2.
	serviceCharge2 := Mock new.
	serviceCharge2 stub amount willReturn: 3.
	expected := 5.
		
	target at: Mock new put: serviceCharge1.
	target at: Mock new put: serviceCharge2.
	
	"Act"
	result := target totalAmount.

	"Assert"
	self assert: result equals: expected