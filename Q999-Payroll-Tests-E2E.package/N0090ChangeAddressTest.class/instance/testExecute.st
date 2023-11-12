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
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/a99d9cfa0ab3a68f2574a56fb80c6b07b902bfde/Q999-Payroll-Tests.package
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