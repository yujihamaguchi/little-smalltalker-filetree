tests
test0060AddSalesReceipt

	"
	[ UseCase4: Request for sales receipt processing ]
	- SalesReceipt <EmpID> <date> <amount>

	Attachment 1: In the case where the selected employee is not paid by the commission.
	  Output an error message only, and perform no further processing.
	"

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
	srt := AddSalesReceipt empId: empId date: date amount: amount.
	srt execute.

	e := PayrollDatabase employeeWithId: empId.

	cc := e classification.
	self deny: cc isNil.
	self assert: cc class equals: CommissionedClassification.

	sr := cc salesReceiptAt: date.
	self deny: sr isNil.
	self assert: sr class equals: SalesReceipt.
	self assert: sr amount equals: amount