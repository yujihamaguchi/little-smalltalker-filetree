execution
execute
	| employee affiliation serviceCharge |
	employee := PayrollDatabase employeeWithUnionMemberId: memberId.
	affiliation := employee affiliation.
	serviceCharge := ServiceCharge date: date amount: amount.
	affiliation addServiceCharge: serviceCharge