tests
test0040DeleteEmployeeE2E

	"
	[ UseCase2: Delete employee ]
	
	- DelEmp <EmpID>
	"

	| empId transaction employee |
	"Arrange"
	empId := 123.
	transaction := AddSalariedEmployee
		               empId: empId
		               name: Mock new
		               address: Mock new
		               salary: Mock new.
	transaction execute.

	employee := PayrollDatabase employeeWithId: empId.
	self deny: employee isNil.

	"Act"
	transaction := DeleteEmployee empId: empId.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	self assert: employee isNil