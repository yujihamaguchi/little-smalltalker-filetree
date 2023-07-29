tests
test0060AddSalesReceipt

	| empId t srt e cc sr date amount |
	empId := 3.

	t := AddCommissionedEmployee
		     empId: empId
		     name: 'Tom'
		     address: 'home'
		     salary: 3000
		     commissionRate: 20.
	t execute.

	date := 20230501.
	amount := 100.
	srt := AddSalesReceipt
		       empId: empId
		       date: date
		       amount: amount.
	srt execute.

	e := PayrollDatabase employee: empId.

	cc := e classification.
	self deny: cc isNil.
	self assert: cc class equals: CommissionedClassification.

	sr := cc salesReceiptAt: date.
	self deny: sr isNil.
	self assert: sr class equals: SalesReceipt.
	self assert: sr amount equals: amount