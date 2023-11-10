tests
testExecuteNoSuchEmployee

	| raisedException empId address transaction |
	"Arrange"
	empId := Mock new.
	address := Mock new.

	(PayrollDatabase stub employeeWithId: empId) willReturn: nil.

	"Act"
	transaction := ChangeAddress empId: empId address: address.
	[ transaction execute ]
		on: Exception
		do: [ :e | raisedException := e ].

	"Assert"
	PayrollDatabase should receive employeeWithId: empId.
	self
		assert: raisedException messageText
		equals: 'No such employee. id: ' , empId asString