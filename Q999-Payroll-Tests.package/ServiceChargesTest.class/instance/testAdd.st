tests
testAdd

	| serviceCharges serviceCharge date |
	"Arrange"
	serviceCharges := ServiceCharges new.
	date := 20231106.
	serviceCharge := ServiceCharge date: date amount: 12.

	"Act"
	serviceCharges add: serviceCharge.

	"Assert"
	self assert: (serviceCharges at: date) equals: serviceCharge