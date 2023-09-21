tests
test0152ChangeHoldTransactionE2E

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