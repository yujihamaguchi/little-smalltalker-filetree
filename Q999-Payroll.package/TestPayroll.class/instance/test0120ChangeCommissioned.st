tests
test0120ChangeCommissioned

	| empId t chct e |
	empId := 1.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.

	t execute.

	chct := ChangeCommissionedTransaction
		        empId: empId
		        salary: 2000
		        commissionRate: 20.
	chct execute.

	e := PayrollDatabase employeeWithId: empId.
	self deny: e isNil.
	self assert: e classification class equals: CommissionedClassification.
	self assert: e schedule class equals: BiweekSchedule.
	self assert: e classification salary equals: 2000.
	self assert: e classification commissionRate equals: 20