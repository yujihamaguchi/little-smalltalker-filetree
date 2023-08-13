tests
test0070AddServiceChargeExp

	| employee affiliation inputDate serviceCharge inputAmount inputMemberId transaction |
	"Arrange"
	inputMemberId := 100.
	inputDate := 20230812.
	inputAmount := 13.

	serviceCharge := ServiceCharge date: inputDate amount: inputAmount.
	(ServiceCharge stub date: inputDate amount: inputAmount) willReturn: serviceCharge.

	employee := Mock new.
	(PayrollDatabase stub employeeWithUnionMemberId: inputMemberId) 
		willReturn: employee.

	affiliation := Mock new.
	employee stub affiliation willReturn: affiliation.

	"Act"
	transaction := AddServiceCharge
		               memberId: inputMemberId
		               date: inputDate
		               amount: inputAmount.
	transaction execute.

	"Assert"
	employee should receive affiliation.
	affiliation should receive addServiceCharge: serviceCharge on: inputDate