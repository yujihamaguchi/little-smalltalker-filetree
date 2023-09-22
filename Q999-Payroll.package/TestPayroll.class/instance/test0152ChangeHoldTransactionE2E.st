tests
test0152ChangeHoldTransactionE2E

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/c6175492d7a9611b453545f4122e6bf205de45eb/Q999-Payroll.package/TestPayroll.class/instance
"
	| inputEmpId employee transaction |
	"Arrange"
	inputEmpId := 123.
	transaction := AddSalariedEmployee
		               empId: inputEmpId
		               name: 'Bob'
		               address: 'NY'
		               salary: 10.
	transaction execute.
	transaction := ChangeMail empId: inputEmpId.
	transaction execute.
	employee := PayrollDatabase employeeWithId: inputEmpId.
	self assert: employee method class equals: MailMethod.

	"Act"
	transaction := ChangeHold empId: inputEmpId.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: inputEmpId.
	self assert: employee method class equals: HoldMethod