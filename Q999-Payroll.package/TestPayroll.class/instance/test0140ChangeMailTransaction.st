tests
test0140ChangeMailTransaction

	| inputEmpId employee mailMethod transaction |
	"Arrange"
	inputEmpId := Mock new.
	employee := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn:
		employee.
	mailMethod := Mock new.
	MailMethod stub new willReturn: mailMethod.

	"Act"
	transaction := ChangeMail empId: inputEmpId.
	transaction execute.

	"Assert"
	PayrollDatabase should receive employeeWithId: inputEmpId.
	MailMethod should receive new.
	employee should receive method: mailMethod