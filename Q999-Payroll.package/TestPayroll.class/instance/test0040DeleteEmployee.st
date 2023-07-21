tests
test0040DeleteEmployee

	| empId t e dt |
	empId := 3.
	t := AddCommissionedEmployee
		     empId: empId
		     name: 'Lance'
		     address: 'Home'
		     salary: 2500
		     commissionRate: 30.

	t execute.

	e := PayrollDatabase employee: empId.
	self deny: e isNil.

	dt := DeleteEmployeeTransaction empId: empId.

	dt execute.

	e := PayrollDatabase employee: empId.
	self assert: e isNil