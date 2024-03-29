tests
testExecuteTimeCardNeedlessEmployee

	"
	You should pass this test with TDD.
	refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/1a265a5df524609d3aaf3858b8e3d50bbf1f50ba/Q999-Payroll-Tests.package
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