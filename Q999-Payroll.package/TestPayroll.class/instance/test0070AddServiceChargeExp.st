tests
test0070AddServiceChargeExp

	| employee affiliation inputDate serviceCharge inputAmount inputMemberId transaction |
	"Arrange"
	inputMemberId := 100.
	inputDate := 20230812.
	inputAmount := 13.
	serviceCharge := ServiceCharge date: inputDate amount: inputAmount.
	affiliation := Mock new.
	(affiliation stub serviceChargeOn: inputDate) willReturn: serviceCharge.
	employee := Mock new.
	employee stub affiliation willReturn: affiliation.
	(PayrollDatabase stub employeeWithUnionMemberId: inputMemberId) willReturn: employee.

	"Act"
	transaction := AddServiceCharge
		               memberId: inputMemberId
		               date: inputDate
		               amount: inputAmount.
	transaction execute.
	
	"Assert"
	self assert: serviceCharge amount equals: inputAmount