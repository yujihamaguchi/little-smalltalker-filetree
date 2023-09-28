tests
test0182PaySingleSalariedEmployeeE2E

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/eccc3ae4750c947717dcae1b1932f88e9cf19ad8/Q999-Payroll.package/TestPayroll.class/instance
"

	| transaction paycheck inputPayDate empId1 empId2 payAmount1 payAmount2 |
	"Arrange"
	inputPayDate := '2023/09/27'.

	empId1 := 123.
	payAmount1 := 1000.
	transaction := AddSalariedEmployee
		               empId: empId1
		               name: Mock new
		               address: Mock new
		               salary: payAmount1.
	transaction execute.

	empId2 := 456.
	payAmount2 := 2000.
	transaction := AddSalariedEmployee
		               empId: empId2
		               name: Mock new
		               address: Mock new
		               salary: payAmount2.
	transaction execute.

	"Act"
	transaction := Payday payDate: inputPayDate.
	transaction execute.

	"Assert"
	paycheck := transaction paycheck: empId1.
	self assert: paycheck payPeriodEndDate equals: inputPayDate.
	self assert: paycheck grossPay equals: payAmount1.
	self assert: (paycheck field: 'Disposition') equals: 'Hold'.
	self assert: paycheck deductions equals: 0.
	self assert: paycheck netPay equals: payAmount1.
	
	paycheck := transaction paycheck: empId2.
	self assert: paycheck payPeriodEndDate equals: inputPayDate.
	self assert: paycheck grossPay equals: payAmount2.
	self assert: (paycheck field: 'Disposition') equals: 'Hold'.
	self assert: paycheck deductions equals: 0.
	self assert: paycheck netPay equals: payAmount2