tests
test0101ChangeHourlyNoSuchEmployee

	| raisedError inputEmpId inputHourlyRate transaction |
	"Arrange"
	inputEmpId := Mock new.
	inputHourlyRate := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn: nil.

	"Action"
	transaction := ChangeHourly
		               empId: inputEmpId
		               hourlyRate: inputHourlyRate.
	[ transaction execute ]
		on: Error
		do: [ :e | raisedError := e ].

	"Assert"
	self deny: raisedError isNil.
	self
		assert: raisedError messageText
		equals: 'No such employee. id: ' , inputEmpId asString