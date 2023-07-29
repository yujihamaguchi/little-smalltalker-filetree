tests
test0052AddTimeCardToNonHourlyEmployee

	| empId t tct raisedError |
	empId := 1.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.

	t execute.

	tct := AddTimeCard empId: empId date: 20230518 hours: 8.

	[ tct execute ]
		on: Error
		do: [ :e | raisedError := e ].
	self assert: raisedError notNil.
	self
		assert: raisedError messageText
		equals: 'Tried to add timecard to non-hourly employee'