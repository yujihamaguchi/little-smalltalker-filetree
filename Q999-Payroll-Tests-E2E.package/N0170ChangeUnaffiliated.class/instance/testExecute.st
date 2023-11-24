tests
testExecute
	"
	[ UseCase6: Change employee's profile ]
	- ChgEmp <EmpID> NoMember

	Attachment 1: In the case where the selected empID / memberID is a non-existent one.
	  Output an error message only, and perform no further processing.
	"

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/4f927f75c8c763338f3aad5affbeeeca0291e0d1/Q999-Payroll.package/TestPayroll.class/instance
"

	| employee empId transaction |
	"Arrange"
	empId := 123.

	transaction := AddSalariedEmployee
		               empId: empId
		               name: Mock new
		               address: Mock new
		               salary: Mock new.
	transaction execute.

	employee := PayrollDatabase employeeWithId: empId.
	self assert: employee affiliation isNil.

	"Act"
	transaction := ChangeUnaffiliated empId: empId.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	self assert: employee affiliation class equals: NoAffiliation