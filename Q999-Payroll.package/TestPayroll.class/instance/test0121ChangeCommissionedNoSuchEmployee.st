tests
test0121ChangeCommissionedNoSuchEmployee

	| inputEmpId inputSalary inputCommissionRate transaction raisedError |
	"Arrange"
	inputEmpId := 123.
	inputSalary := Mock new.
	inputCommissionRate := Mock new.

	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn: nil.

	"Act"
	transaction := ChangeCommissoned
		               empId: inputEmpId
		               salary: inputSalary
		               commissionRate: inputCommissionRate.
	[ transaction execute ]
		on: Exception
		do: [ :e | raisedError := e ].

	"Assert"
	self deny: raisedError isNil.
	self
		assert: raisedError messageText
		equals: 'No such employee. id: ' , inputEmpId asString