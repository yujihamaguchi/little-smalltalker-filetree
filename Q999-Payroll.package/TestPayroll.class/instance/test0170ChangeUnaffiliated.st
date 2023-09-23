tests
test0170ChangeUnaffiliated

	| employee noAffiliation inputEmpId transaction |
	"Arrange"
	inputEmpId := Mock new.
	employee := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn:
		employee.
	noAffiliation := Mock new.
	NoAffiliation stub new willReturn: noAffiliation.

	"Act"
	transaction := ChangeUnaffiliated empId: inputEmpId.
	transaction execute.

	"Assert"
	PayrollDatabase should receive employeeWithId: inputEmpId.
	NoAffiliation should receive new.
	employee should receive affiliation: noAffiliation