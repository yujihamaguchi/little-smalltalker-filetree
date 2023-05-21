tests
testChangeHourlyTransaction

	| empId t chct e |
	empId := 1.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.

	t execute.

	chct := ChangeHourlyTransaction
		        empId: empId
		        hourlyRate: 10.
	chct execute.

	e := PayrollDatabase employee: empId.
	self deny: e isNil.
	self assert: e classification class equals: HourlyClassification.
	self assert: e schedule class equals: WeeklyShedule.	
	self assert: e classification hourlyRate equals: 10