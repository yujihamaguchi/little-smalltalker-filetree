tests
testExecute

	"
	[ UseCase6: Change employee's profile ]
	- ChgEmp <EmpID> Direct <bank> <account>

	Attachment 1: In the case where the selected empID / memberID is a non-existent one.
	  Output an error message only, and perform no further processing.
	"

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/38f63fa7582e15150a8b3ce642ddb26e7c793143/Q999-Payroll-Tests.package
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
	self assert: employee method class equals: HoldMethod.

	"Act"
	transaction := ChangeDirect empId: empId.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	self assert: employee method class equals: DirectMethod