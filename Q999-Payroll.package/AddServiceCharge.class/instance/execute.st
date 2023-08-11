execution
execute

	| employee affiliation serviceCharge |
	employee := PayrollDatabase employeeWithUnionMemberId: memberId.
	serviceCharge := ServiceCharge date: date amount: amount.
	affiliation := employee affiliation.
	affiliation addServiceCharge: serviceCharge on: date