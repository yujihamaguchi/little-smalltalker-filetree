tests
testExecute

	"
	[ UseCase4: Request for sales receipt processing ]
	- SalesReceipt <EmpID> <date> <amount>

	Attachment 1: In the case where the selected employee is not paid by the commission.
	  Output an error message only, and perform no further processing.
	"

	| empId transaction employee classification salesReceipt date amount |
	"Arrange"
	empId := 3.
	date := 20230501.
	amount := 100.

	transaction := AddCommissionedEmployee
		               empId: empId
		               name: 'Tom'
		               address: 'home'
		               salary: 3000
		               commissionRate: 20.
	transaction execute.

	"Action"
	transaction := AddSalesReceipt empId: empId date: date amount: amount.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.

	classification := employee classification.
	self deny: classification isNil.
	self assert: classification class equals: CommissionedClassification.

	salesReceipt := classification salesReceiptAt: date.
	self deny: salesReceipt isNil.
	self assert: salesReceipt class equals: SalesReceipt.
	self assert: salesReceipt amount equals: amount