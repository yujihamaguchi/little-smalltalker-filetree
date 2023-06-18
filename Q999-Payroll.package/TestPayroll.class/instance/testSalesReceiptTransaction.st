tests
testSalesReceiptTransaction

	| empId t srt e cc sr receiptDate |
	empId := 3.

	t := AddCommissionedEmployee
		     empId: empId
		     name: 'Tom'
		     address: 'home'
		     salary: 3000
		     commissionRate: 20.
	t execute.

	receiptDate := MyDate fromString: '05/01/2023'.
	srt := SalesReceiptTransaction
		       date: receiptDate
		       amount: 100
		       empId: empId.
	srt execute.

	e := PayrollDatabase employee: empId.

	cc := e classification.
	self deny: cc isNil.
	self assert: cc class equals: CommissionedClassification.

	sr := cc salesReceipt: receiptDate.
	self deny: sr isNil.
	self assert: sr class equals: SalesReceipt.
	self assert: sr amount equals: 100