tests
testExecute

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/d13a7089da1bf43505120498602771dd0b471d46/Q999-Payroll.package/TestPayroll.class/instance
"

	| empId employee transaction |
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
	transaction := ChangeMail empId: empId.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	self assert: employee method class equals: MailMethod