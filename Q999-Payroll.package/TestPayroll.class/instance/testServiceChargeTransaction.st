tests
testServiceChargeTransaction

	| empId t tct e af memberId sct |
	empId := 2.

	t := AddHourlyEmployee
		     empId: empId
		     name: 'Bill'
		     address: 'Home'
		     hourlyRate: 15.

	t execute.

	tct := TimeCardTransaction date: 20230518 hours: 8 empId: empId.
	tct execute.

	e := PayrollDatabase employee: empId.

	af := UnionAffiliation dues: 12.
	e affiliation: af.
	memberId := 10.
	PayrollDatabase addUnionMember: e id: memberId.
	sct := ServiceChargeTransaction
		       date: 20230601
		       amount: 13
		       memberId: memberId.
	sct execute.
	self assert: af serviceCharge equals: 13