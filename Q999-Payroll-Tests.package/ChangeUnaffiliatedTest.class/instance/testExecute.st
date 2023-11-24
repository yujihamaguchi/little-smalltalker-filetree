tests
testExecute

	| empId employee transaction noAffiliation |
	"Arrange"
	empId := Mock new.

	employee := Mock new.
	(PayrollDatabase stub employeeWithId: empId) willReturn: employee.
	noAffiliation := Mock new.
	NoAffiliation stub new willReturn: noAffiliation.

	"Act"
	transaction := ChangeUnaffiliated empId: empId.
	transaction execute.

	"Assert"
	PayrollDatabase should receive employeeWithId: empId.
	NoAffiliation should receive new.
	employee should receive affiliation: noAffiliation