tests
testCalculateDeductions

	| target paycheck totalServiceCharge serviceCharges targetServiceCharges dues result numberOfFridays startDate endDate totalDues expected |
	"Arrange"
	target := UnionAffiliation memberId: Mock new dues: Mock new.
	paycheck := Mock new.
	startDate := Mock new.
	paycheck stub startDate willReturn: startDate.
	endDate := Mock new.
	paycheck stub endDate willReturn: endDate.

	serviceCharges := Mock new.
	target stub serviceCharges willReturn: serviceCharges.
	targetServiceCharges := Mock new.
	(serviceCharges stub between: startDate and: endDate) willReturn:
		targetServiceCharges.
	totalServiceCharge := Mock new.
	targetServiceCharges stub totalAmount willReturn: totalServiceCharge.

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
	result := target calculateDeductions: paycheck.

	"Assert"
	target should receive serviceCharges.
	serviceCharges should receive
		between: paycheck startDate
		and: paycheck endDate.
	targetServiceCharges should receive totalAmount.
	target should receive
		numberOfFridaysBetween: startDate
		and: endDate.
	target should receive dues.

	self assert: result equals: expected