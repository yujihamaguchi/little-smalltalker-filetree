tests
test0182PaySingleSalariedEmployeeE2E

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/eccc3ae4750c947717dcae1b1932f88e9cf19ad8/Q999-Payroll.package/TestPayroll.class/instance
"

	| transaction paycheck inputPayDate empId payAmount |
	"Arrange"
	inputPayDate := '2023/09/27'.

	empId := 123.
	payAmount := 1000.
	transaction := AddSalariedEmployee
		               empId: empId
		               name: 'Bob'
		               address: 'Home'
		               salary: 1000.
	transaction execute.

	"Act"
	transaction := Payday payDate: inputPayDate.
	transaction execute.

	"Assert"
	paycheck := transaction paycheck: empId.
	self assert: paycheck payPeriodEndDate equals: inputPayDate.
	self assert: paycheck grossPay equals: payAmount.
	self assert: (paycheck field: 'Disposition') equals: 'Hold'.
	self assert: paycheck deductions equals: 0.
	self assert: paycheck netPay equals: payAmount