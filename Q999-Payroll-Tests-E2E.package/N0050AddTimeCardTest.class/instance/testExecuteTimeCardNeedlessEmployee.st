tests
testExecuteTimeCardNeedlessEmployee

	"
	You should pass this test with TDD.
	refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/4e270254dbbda5f6dd17ca0e7d1b88a1811e5eb3/Q999-Payroll.package/TestPayroll.class/instance
"

	| empId transaction name address date hours raisedException salary |
	"Arrange"
	empId := 123.
	name := 'Bill'.
	address := 'Home'.
	salary := 1000.
	date := 20230518.
	hours := 8.

	transaction := AddSalariedEmployee
		               empId: empId
		               name: name
		               address: address
		               salary: salary.

	transaction execute.

	"Act"
	transaction := AddTimeCard empId: empId date: date hours: hours.

	[ transaction execute ]
		on: Exception
		do: [ :e | raisedException := e ].

	"Assert"
	self
		assert: raisedException messageText
		equals:
		'Message not understood: SalariedClassification >> #addTimeCard:'