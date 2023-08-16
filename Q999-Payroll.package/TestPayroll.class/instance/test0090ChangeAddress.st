tests
test0090ChangeAddress

	| inputEmpId inputAddress employee transaction |
	"Arrange"
	inputEmpId := Mock new.
	inputAddress := Mock new.
	employee := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn:
		employee.

	"Action"
	transaction := ChangeAddress empId: inputEmpId address: inputAddress.
	transaction execute.

	"Assert"
	employee should receive address: inputAddress