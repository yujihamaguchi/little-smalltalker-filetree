execution
execute

	| employee affiliation serviceCharge |
	serviceCharge := ServiceCharge date: date amount: amount.
	employee := PayrollDatabase employeeWithUnionMemberId: memberId.
	affiliation := employee affiliation.
	affiliation addServiceCharge: serviceCharge on: date
