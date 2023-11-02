tests
testExecuteSalesReceiptNeedlessEmployee

	| empId date amount transaction raisedException name address hourlyRate |
	"Arrange"
	empId := 123.
	name := 'Bob'.
	address := 'NY'.
	hourlyRate := 10.

	transaction := AddHourlyEmployee
		               empId: empId
		               name: name
		               address: address
		               hourlyRate: hourlyRate.
	transaction execute.

	date := 20231102.
	amount := 10.

	"Act"
	transaction := AddSalesReceipt empId: empId date: date amount: amount.
	[ transaction execute ]
		on: Exception
		do: [ :e | raisedException := e ].

	"Assert"
	self
		assert: raisedException messageText
		equals:
		'Message not understood: HourlyClassification >> #addSalesReceipt:'