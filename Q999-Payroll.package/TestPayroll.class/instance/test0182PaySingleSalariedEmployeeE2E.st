tests
test0182PaySingleSalariedEmployeeE2E

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/84d737d3d2db24ec929aaf8a29b5035aad9490d0/Q999-Payroll.package/TestPayroll.class/instance

spec:
- About `deductions`
Retrieve the service charges from the set held by UnionAffiliation that correspond to the start and end dates of the Paycheck, and sum their amounts.
On the other hand, calculate the amount by multiplying the dues held by UnionAffiliation with the number of Fridays contained between the start and end dates of the Paycheck.
The sum of these two calculations will be the deductions.
"

	| transaction paycheck inputPayDate empId1 empId2 payAmount1 payAmount2 memberId1 memberId2 |
	"Arrange"
	inputPayDate := '2023/09/27'.

	empId1 := 123.
	memberId1 := 1234.
	payAmount1 := 1000.
	transaction := AddSalariedEmployee
		               empId: empId1
		               name: Mock new
		               address: Mock new
		               salary: payAmount1.
	transaction execute.

	transaction := ChangeMember
		               empId: empId1
		               memberId: memberId1
		               dues: Mock new.
	transaction execute.

	transaction := AddServiceCharge memberId: memberId1 date: Mock new amount: Mock new.
	transaction execute.

	empId2 := 456.
	memberId2 := 4567.
	payAmount2 := 2000.
	transaction := AddSalariedEmployee
		               empId: empId2
		               name: Mock new
		               address: Mock new
		               salary: payAmount2.
	transaction execute.

	transaction := ChangeMember
		               empId: empId2
		               memberId: memberId2
		               dues: Mock new.
	transaction execute.

	transaction := AddServiceCharge memberId: memberId2 date: Mock new amount: Mock new.
	transaction execute.

	"Act"
	transaction := Payday payDate: inputPayDate.
	transaction execute.

	"Assert"
	paycheck := transaction paycheck: empId1.
	self assert: paycheck endDate equals: inputPayDate.
	self assert: paycheck grossPay equals: payAmount1.
	self assert: (paycheck field: 'Disposition') equals: 'Hold'.
	self assert: paycheck deductions equals: 0.
	self assert: paycheck netPay equals: payAmount1.
	
	paycheck := transaction paycheck: empId2.
	self assert: paycheck endDate equals: inputPayDate.
	self assert: paycheck grossPay equals: payAmount2.
	self assert: (paycheck field: 'Disposition') equals: 'Hold'.
	self assert: paycheck deductions equals: 0.
	self assert: paycheck netPay equals: payAmount2