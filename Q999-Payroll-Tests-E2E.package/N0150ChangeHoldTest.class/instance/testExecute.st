tests
testExecute

	"
	[ UseCase6: Change employee's profile ]
	- ChgEmp <EmpID> Hold

	Attachment 1: In the case where the selected empID / memberID is a non-existent one.
	  Output an error message only, and perform no further processing.
	"

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/033d61e78a007fce9990b3cf1cf7bd34817068f6/Q999-Payroll-Tests.package
"

	| empId employee transaction |
	"Arrange"
	empId := 123.

	transaction := AddSalariedEmployee
		               empId: empId
		               name: 'Bob'
		               address: 'NY'
		               salary: 10.
	transaction execute.

	transaction := ChangeMail empId: empId.
	transaction execute.

	employee := PayrollDatabase employeeWithId: empId.
	self assert: employee method class equals: MailMethod.

	"Act"
	transaction := ChangeHold empId: empId.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	self assert: employee method class equals: HoldMethod