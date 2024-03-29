tests
testExecuteNoSuchEmployee

	| raisedException empId transaction |
	"Arrange"
	empId := Mock new.
	(PayrollDatabase stub employeeWithId: empId) willReturn: nil.
	
	"Act"
	transaction := AddSalesReceipt
		               empId: empId
		               date: Mock new
		               amount: Mock new.
	[ transaction execute ]
		on: Exception
		do: [ :e | raisedException := e ].

	"Assert"
	PayrollDatabase should receive employeeWithId: empId.
	self
		assert: raisedException messageText
		equals: 'No such employee. id: ' , empId asString