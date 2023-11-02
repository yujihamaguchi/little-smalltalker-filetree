execution
execute

	| employee classification salesReceipt |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ 
		Exception signal: 'No such employee. id: ' , empId asString ].
	classification := employee classification.
	salesReceipt := SalesReceipt date: date amount: amount.
	classification addSalesReceipt: salesReceipt