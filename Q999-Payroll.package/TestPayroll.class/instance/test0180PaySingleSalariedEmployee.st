tests
test0180PaySingleSalariedEmployee

	| inputPayDate transaction empId employee payPeriodStartDate payCheck payCheckUpdated |
	"Arrange"
	inputPayDate := Mock new.

	empId := Mock new.
	PayrollDatabase stub allEmployeeIds willReturn: { empId }.

	employee := Mock new.
	(PayrollDatabase stub employeeWithId: empId) willReturn: employee.

	payPeriodStartDate := Mock new.
	(employee stub payPeriodStartDate: inputPayDate) willReturn:
		payPeriodStartDate.

	payCheck := Mock new.
	(Paycheck stub from: payPeriodStartDate to: inputPayDate) 
		willReturn: payCheck.

	payCheckUpdated := Mock new.
	(employee stub payday: payCheck) willReturn: payCheckUpdated.

	"Act"
	transaction := Payday payDate: inputPayDate.
	transaction execute.

	"Assert"
	PayrollDatabase should receive allEmployeeIds.
	PayrollDatabase should receive employeeWithId: empId.
	employee should receive payPeriodStartDate: inputPayDate.
	Paycheck should receive from: payPeriodStartDate to: inputPayDate.
	employee should receive payday: payCheck