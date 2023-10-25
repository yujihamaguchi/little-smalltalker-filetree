tests
test0054AddTimeCardToNeedlessEmployeeE2E

	| raisedException transaction empId employee classification timecard exception date hours |
	"Arrange"
	empId := Mock new.
	date := Mock new.
	hours := Mock new.

	employee := Mock new.
	(PayrollDatabase stub employeeWithId: empId) willReturn: employee.

	classification := Mock new.
	employee stub classification willReturn: classification.

	timecard := Mock new.
	(TimeCard stub date: date hours: hours) willReturn: timecard.

	exception := Exception new.
	exception stub messageText willReturn:
		'This classification does not handle time card. classification: SalariedClassification'.
	(classification stub addTimecard: timecard) willRaise: exception.

	"Act"
	transaction := AddTimeCard empId: empId date: date hours: hours.
	[ transaction execute ]
		on: Exception
		do: [ :e | raisedException := e ].

	"Assert"
	self
		assert: raisedException messageText
		equals:
		'This classification does not handle time card. classification: SalariedClassification'