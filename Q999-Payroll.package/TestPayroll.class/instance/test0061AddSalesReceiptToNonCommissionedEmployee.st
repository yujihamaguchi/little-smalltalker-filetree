tests
test0061AddSalesReceiptToNonCommissionedEmployee
"
	| empId t tct raisedError |
	empId := 123.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.

	t execute.

	tct := AddSalesReceipt empId: empId date: 20230518 amount: 8.

	[ tct execute ]
		on: Error
		do: [ :e | raisedError := e ].
	self assert: raisedError notNil.
	self
		assert: raisedError messageText
		equals: 'Tried to add sales receipt to non-commissioned employee: SalariedClassification'"