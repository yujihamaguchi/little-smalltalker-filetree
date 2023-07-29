execution
execute

	| employee classification salesReceipt |
	employee := PayrollDatabase employee: empId.
	employee ifNil: [ ^ Error signal: 'No Such Emolopyee' ].
	classification := employee classification.
	classification class = CommissionedClassification ifFalse: [ 
		^ Error signal:
			  'Tried to add sales receipt to non-commissioned employee' ].
	salesReceipt := SalesReceipt date: date amount: amount.
	classification addSalesReceipt: salesReceipt