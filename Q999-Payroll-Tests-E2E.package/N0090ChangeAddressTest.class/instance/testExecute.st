tests
testExecute

	"
	[ UseCase6: Change employee's profile ]
	- ChgEmp <EmpID> Address <address>

	Attachment 1: In the case where the selected empID / memberID is a non-existent one.
	  Output an error message only, and perform no further processing.
	"

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/7de7de292bf02e838e78c4723b571b6aa0eea42c/Q999-Payroll.package/TestPayroll.class/instance
"

	| empId transaction employee address |
	"Arrange"
	empId := 123.
	address := 'NY'.
	transaction := AddSalariedEmployee
		               empId: empId
		               name: 'Bob'
		               address: address
		               salary: 10.
	transaction execute.

	"Action"
	transaction := ChangeAddress empId: empId address: address.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	self deny: employee isNil.
	self assert: employee address equals: address