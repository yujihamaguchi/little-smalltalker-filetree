tests
testSalesReceiptTransaction

	| empId t srt e cc sr |
	empId := 3.

	t := AddCommissionedEmployee
		     empId: empId
		     name: 'Tom'
		     address: 'home'
		     salary: 3000
		     commissionRate: 20.
	t execute.

	srt := SalesReceiptTransaction
		       date: 20230501
		       amount: 100
		       empId: empId.
	srt execute.

	e := PayrollDatabase employee: empId.

	cc := e classification.
	self deny: cc isNil.
	self assert: cc class equals: CommissionedClassification.

	sr := cc salesReceipt: 20230501.
	self deny: sr isNil.
	self assert: sr class equals: SalesReceipt.
	self assert: sr amount equals: 100