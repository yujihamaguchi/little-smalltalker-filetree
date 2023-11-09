tests
testExecuteNoSuchEmployee

	| raisedException empId name transaction |
	"Arrange"
	empId := Mock new.
	name := Mock new.
	(PayrollDatabase stub employeeWithId: empId) willReturn: nil.

	"Act"
	transaction := ChangeName empId: empId name: name.
	[ transaction execute ]
		on: Exception
		do: [ :e | raisedException := e ].
	"Assert"
	PayrollDatabase should receive employeeWithId: empId.
	self
		assert: raisedException messageText
		equals: 'No such employee. id: ' , empId asString