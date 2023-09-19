tests
test0130ChangeDirectTransaction

	| employee directMethod inputEmpId transaction |
	"Arrange"
	inputEmpId := Mock new.
	employee := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn: employee.
	directMethod := Mock new.
	DirectMethod stub new willReturn: directMethod.

	"Act"
	transaction := ChangeDirect empId: inputEmpId.
	transaction execute.

	"Assert"
	PayrollDatabase should receive employeeWithId: inputEmpId.
	DirectMethod should receive new.
	employee should receive method: directMethod