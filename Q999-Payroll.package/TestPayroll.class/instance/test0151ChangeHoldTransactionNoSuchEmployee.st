tests
test0151ChangeHoldTransactionNoSuchEmployee

	| raisedException inputEmpId transaction |
	"Arrange"
	inputEmpId := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn: nil.

	"Act"
	transaction := ChangeHold empId: inputEmpId.
	[ transaction execute ]
		on: Exception
		do: [ :e | raisedException := e ].
	"Assert"
	self
		assert: raisedException messageText
		equals: 'No such employee. id: ' , inputEmpId asString