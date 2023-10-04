tests
testCalculateDeductions

	| target paycheck actual expected totalServiceCharge totalDues startDate endDate filterdServiceCharges serviceCharges dues numberOfFridays |
	"Arrange"
	target := UnionAffiliation memberId: Mock new dues: Mock new.
	startDate := Mock new.
	endDate := Mock new.
	paycheck := Paycheck from: startDate to: endDate.

	serviceCharges := Mock new.
	target stub serviceCharges willReturn: serviceCharges.
	filterdServiceCharges := Mock new.
	(serviceCharges stub between: startDate and: endDate) willReturn:
		filterdServiceCharges.
	totalServiceCharge := Mock new.
	filterdServiceCharges stub totalAmount willReturn: totalServiceCharge.

	numberOfFridays := Mock new.
	(target stub numberOfFridaysBetween: startDate and: endDate) 
		willReturn: numberOfFridays.
	dues := Mock new.
	target stub dues willReturn: dues.
	totalDues := Mock new.
	numberOfFridays stub * dues willReturn: totalDues.

	expected := Mock new.
	totalServiceCharge stub + totalDues willReturn: expected.

	"Act"
	actual := target calculateDeductions: paycheck.

	"Assert"
	target should receive serviceCharges.
	serviceCharges should receive between: startDate and: endDate.
	filterdServiceCharges should receive totalAmount.
	target should receive numberOfFridaysBetween: startDate and: endDate.
	target should receive dues.
	numberOfFridays should receive * dues.
	totalServiceCharge should receive + totalDues.

	self assert: actual equals: expected