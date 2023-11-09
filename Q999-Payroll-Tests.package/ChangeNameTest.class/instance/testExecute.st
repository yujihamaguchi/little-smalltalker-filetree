tests
testExecute

	| employee name empId transaction |
	"Arrange"
	empId := Mock new.
	name := Mock new.

	employee := Mock new.
	(PayrollDatabase stub employeeWithId: empId) willReturn: employee.

	"Act"
	transaction := ChangeName empId: empId name: name.
	transaction execute.

	"Assert"
	PayrollDatabase should receive employeeWithId: empId.
	employee should receive name: name