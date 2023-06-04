tests
testAddSalariedEmployee

	| empId t e sc ms hm |
	empId := 1.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.

	t execute.

	e := PayrollDatabase employee: empId.
	self deny: e isNil.
	self assert: e class equals: Employee.
	self assert: e name equals: 'Bob'.

	sc := e classification.
	self deny: sc isNil.
	self assert: sc class equals: SalariedClassification.
	self assert: sc salary equals: 1000.

	ms := e schedule.
	self deny: ms isNil.
	self assert: ms class equals: MonthlySchedule.

	hm := e method.
	self deny: hm isNil.
	self assert: hm class equals: HoldMethod