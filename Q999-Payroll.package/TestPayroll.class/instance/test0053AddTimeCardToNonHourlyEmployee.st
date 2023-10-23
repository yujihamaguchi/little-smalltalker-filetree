tests
test0053AddTimeCardToNonHourlyEmployee

	| raisedException transaction empId employee classification |
	"Arrange"
	empId := Mock new.
	employee := Mock new.
	(PayrollDatabase stub employeeWithId: empId) willReturn: employee.
	classification := Mock new.
	classification stub class willReturn: SalariedClassification.
	employee stub classification willReturn: classification.

	"Act"
	transaction := AddTimeCard
		               empId: empId
		               date: Mock new
		               hours: Mock new.
	[ transaction execute ]
		on: Exception
		do: [ :e | raisedException := e ].

	"Assert"
	self
		assert: raisedException messageText
		equals:
		'Tried to add timecard to non-hourly employee: SalariedClassification'
	"
	| empId t tct raisedError |
	empId := 123.
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
		equals: 'Tried to add timecard to non-hourly employee: SalariedClassification'"