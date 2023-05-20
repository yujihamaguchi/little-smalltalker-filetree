tests
testTimeCardTransaction

	| empId t tct e hc tc |
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

	hc := e classification.
	self deny: hc isNil.
	self assert: hc class equals: HourlyClassification.

	tc := hc timecard: 20230518.
	self deny: tc isNil.
	self assert: tc class equals: TimeCard.
	self assert: tc hours equals: 8