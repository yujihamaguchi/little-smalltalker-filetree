tests
test0090ChangeAddressNoSuchEmployee

	| raisedError inputEmpId inputAddress transaction |
	"Arrange"
	inputEmpId := Mock new.
	inputAddress := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn: nil.

	"Action"
	transaction := ChangeAddress empId: inputEmpId address: inputAddress.
	[ transaction execute ]
		on: Error
		do: [ :e | raisedError := e ].

	"Assert"
	self deny: raisedError isNil.
	self
		assert: raisedError messageText
		equals: 'No such employee. id: ' , inputEmpId asString