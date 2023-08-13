tests
test0070AddServiceCharge

	"
	[ UseCase4: Request for service charge processing ]
	- AddServiceCharge <memberID> <date> <amount>

	Attachment 1: In the case where the selected memberID is a non-existent union member.
	  Output an error message only, and perform no further processing.
	"

	| employee affiliation inputDate inputAmount inputMemberId transaction serviceCharge |
	"Arrange"
	inputMemberId := 100.
	inputDate := 20230801.
	inputAmount := 12.
	
	employee := Mock new.
	(PayrollDatabase stub employeeWithUnionMemberId: inputMemberId) willReturn: employee.
	affiliation := Mock new.
	employee stub affiliation willReturn: affiliation.
	serviceCharge := Mock new.
	(ServiceCharge stub date: inputDate amount: inputAmount) willReturn: serviceCharge.	
	 
	"Action"
	transaction := AddServiceCharge memberId: inputMemberId date: inputDate amount: inputAmount.
	transaction execute.
	
	"Assert"
	employee should receive affiliation.
	affiliation should receive addServiceCharge: serviceCharge on: inputDate.