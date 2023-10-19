tests
test0041DeleteEmployee

	| empId transaction employee |
	"Arrange"
	empId := Mock new.
	employee := Mock new.
	(PayrollDatabase stub employeeWithId: empId) willReturn: employee.
	(PayrollDatabase stub removeEmployeeWithId: empId) willReturnYourself.

	"Act"
	transaction := DeleteEmployee empId: empId.
	transaction execute.

	"Assert"
	PayrollDatabase should receive employeeWithId: empId.
	PayrollDatabase should receive removeEmployeeWithId: empId