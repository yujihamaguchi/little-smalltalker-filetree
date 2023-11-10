tests
testExecute

	| employee address empId transaction |
	"Arrange"
	empId := Mock new.
	address := Mock new.

	employee := Mock new.
	(PayrollDatabase stub employeeWithId: empId) willReturn: employee.

	"Act"
	transaction := ChangeAddress empId: empId address: address.
	transaction execute.

	"Assert"
	PayrollDatabase should receive employeeWithId: empId.
	employee should receive address: address