tests
test0161ChangeMemberTransactionNoSuchEmployee

	| raisedException inputEmpId transaction |
	"Arrange"
	inputEmpId := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn: nil.

	"Act"
	transaction := ChangeMember
		               empId: inputEmpId
		               memberId: Mock new
		               dues: Mock new.
	[ transaction execute ]
		on: Exception
		do: [ :e | raisedException := e ].

	"Assert"
	self
		assert: raisedException messageText
		equals: 'No such employee. id: ' , inputEmpId asString