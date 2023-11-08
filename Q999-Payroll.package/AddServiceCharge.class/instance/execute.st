execution
execute

	| employee affiliation serviceCharge |
	employee := PayrollDatabase employeeWithUnionMemberId: memberId.
	employee ifNil: [ 
		Exception signal: 'No such member. id: ' , memberId asString ].
	affiliation := employee affiliation.
	serviceCharge := ServiceCharge date: date amount: amount.
	affiliation addServiceCharge: serviceCharge