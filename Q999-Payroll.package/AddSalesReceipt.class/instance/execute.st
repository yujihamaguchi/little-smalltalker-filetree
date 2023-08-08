execution
execute

	| employee classification salesReceipt |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ ^ Error signal: 'No Such Emolopyee' ].
	classification := employee classification.
	classification class = CommissionedClassification ifFalse: [ 
		^ Error signal:
			  ('Tried to add sales receipt to non-commissioned employee: {1}' 
				   format: { classification class asString }) ].
	salesReceipt := SalesReceipt date: date amount: amount.
	classification addSalesReceipt: salesReceipt