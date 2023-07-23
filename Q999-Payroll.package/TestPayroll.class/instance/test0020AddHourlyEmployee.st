tests
test0020AddHourlyEmployee
	| empId t e hc ws hm |
	empId := 2.
	t := AddHourlyEmployee
		     empId: empId
		     name: 'John'
		     address: 'NewYork'
		     hourlyRate: 10.

	t execute.

	e := PayrollDatabase employee: empId.
	self deny: e isNil.
	self assert: e class equals: Employee.
	self assert: e name equals: 'John'.
	self assert: e address equals: 'NewYork'.	

	hc := e classification.
	self deny: hc isNil.
	self assert: hc class equals: HourlyClassification.
	self assert: hc hourlyRate equals: 10.

	ws := e schedule.
	self deny: ws isNil.
	self assert: ws class equals: WeeklyShedule.

	hm := e method.
	self deny: hm isNil.
	self assert: hm class equals: HoldMethod