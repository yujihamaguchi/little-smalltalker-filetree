tests
testExecute

	| employee holdMethod empId transaction |
	"Arrange"
	empId := Mock new.

	employee := Mock new.
	(PayrollDatabase stub employeeWithId: empId) willReturn: employee.
	holdMethod := Mock new.
	HoldMethod stub new willReturn: holdMethod.

	"Act"
	transaction := ChangeHold empId: empId.
	transaction execute.

	"Assert"
	PayrollDatabase should receive employeeWithId: empId.
	HoldMethod should receive new.
	employee should receive method: holdMethod