tests
testExecute

	| empId date transaction employee classification amount salesReceipt |
	"Arrange"
	empId := Mock new.
	date := Mock new.
	amount := Mock new.

	employee := Mock new.
	(PayrollDatabase stub employeeWithId: empId) willReturn: employee.
	classification := Mock new.
	employee stub classification willReturn: classification.
	salesReceipt := Mock new.
	(SalesReceipt stub date: date amount: amount) willReturn:
		salesReceipt.

	"Act"
	transaction := AddSalesReceipt empId: empId date: date amount: amount.
	transaction execute.

	"Assert"
	PayrollDatabase should receive employeeWithId: empId.
	employee should receive classification.
	SalesReceipt should receive date: date amount: amount.
	classification should receive addSalesReceipt: salesReceipt