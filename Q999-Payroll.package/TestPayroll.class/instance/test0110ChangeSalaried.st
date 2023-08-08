tests
test0110ChangeSalaried

	| empId t chct e |
	empId := 1.
	t := AddHourlyEmployee
		     empId: empId
		     name: 'John'
		     address: 'NewYork'
		     hourlyRate: 10.

	t execute.

	chct := ChangeSalariedTransaction empId: empId salary: 1000.
	chct execute.

	e := PayrollDatabase employeeWithId: empId.
	self deny: e isNil.
	self assert: e classification class equals: SalariedClassification.
	self assert: e schedule class equals: MonthlySchedule.
	self assert: e classification salary equals: 1000