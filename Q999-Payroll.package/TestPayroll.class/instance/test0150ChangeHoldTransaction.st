tests
test0150ChangeHoldTransaction

	| inputEmpId employee holdMethod transaction |
	"Arrange"
	inputEmpId := Mock new.
	employee := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn:
		employee.
	holdMethod := Mock new.
	HoldMethod stub new willReturn: holdMethod.

	"Act"
	transaction := ChangeHold empId: inputEmpId.
	transaction execute.

	"Assert"
	PayrollDatabase should receive employeeWithId: inputEmpId.
	HoldMethod should receive new.
	employee should receive method: holdMethod