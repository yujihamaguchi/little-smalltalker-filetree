tests
test0111ChangeSalariedNoSuchEmployee

	| raisedError inputEmpId inputSalary transaction |
	"Arrange"
	inputEmpId := 123.
	inputSalary := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn: nil.

	"Act"
	transaction := ChangeSalaried empId: inputEmpId salary: inputSalary.
	[ transaction execute ]
		on: Error
		do: [ :e | raisedError := e ].

	"Assert"
	self deny: raisedError isNil.
	self
		assert: raisedError messageText
		equals: 'No such employee. id: ' , inputEmpId asString