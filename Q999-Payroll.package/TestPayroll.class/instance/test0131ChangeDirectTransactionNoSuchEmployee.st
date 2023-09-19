tests
test0131ChangeDirectTransactionNoSuchEmployee

	| raisedException inputEmpId transaction |
	"Arrange"
	inputEmpId := Mock new.

	"Act"
	transaction := ChangeDirect empId: inputEmpId.
	[ transaction execute ]
		on: Exception
		do: [ :e | raisedException := e ].

	"Assert"
	self
		assert: raisedException messageText
		equals: 'No such employee. id: ' , inputEmpId asString