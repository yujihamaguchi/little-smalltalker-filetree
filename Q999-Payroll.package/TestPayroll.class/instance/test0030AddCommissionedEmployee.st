tests
test0030AddCommissionedEmployee

	| empId t e cm bs hm |
	empId := 3.
	t := AddCommissionedEmployee
		     empId: empId
		     name: 'Mike'
		     address: 'Chicago'
		     salary: 2000
		     commissionRate: 20.

	t execute.

	e := PayrollDatabase employeeWithId: empId.
	self deny: e isNil.
	self assert: e class equals: Employee.
	self assert: e name equals: 'Mike'.

	cm := e classification.
	self deny: cm isNil.
	self assert: cm class equals: CommissionedClassification.
	self assert: cm salary equals: 2000.
	self assert: cm commissionRate equals: 20.

	bs := e schedule.
	self deny: bs isNil.
	self assert: bs class equals: BiweekSchedule.

	hm := e method.
	self deny: hm isNil.
	self assert: hm class equals: HoldMethod