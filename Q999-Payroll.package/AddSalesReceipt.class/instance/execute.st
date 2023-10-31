execution
execute

	| employee classification salesReceipt |
	employee := PayrollDatabase employeeWithId: empId.
	classification := employee classification.
	salesReceipt := SalesReceipt date: date amount: amount.
	classification addSalesReceipt: salesReceipt