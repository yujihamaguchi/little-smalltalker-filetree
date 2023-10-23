tests
test0040DeleteEmployeeE2E

	"
	[ UseCase2: Delete employee ]
	
	- DelEmp <EmpID>
	"

	"
	You should pass this test with TDD.
	refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/a933043167f152c9556df7a51822e43753c23ad4/Q999-Payroll.package/TestPayroll.class/instance
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