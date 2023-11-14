tests
testExecute

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/7de7de292bf02e838e78c4723b571b6aa0eea42c/Q999-Payroll.package/TestPayroll.class/instance
"

	| empId salary commissionRate transaction employee classification schedule |
	"Arrange"
	empId := 123.
	salary := 12.
	commissionRate := 23.

	transaction := AddSalariedEmployee
		               empId: empId
		               name: 'Bob'
		               address: 'NY City'
		               salary: 0.
	transaction execute.

	"Act"
	transaction := ChangeCommissoned
		               empId: empId
		               salary: salary
		               commissionRate: commissionRate.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.

	classification := employee classification.
	self assert: classification class equals: CommissionedClassification.
	self assert: classification salary equals: salary.
	self assert: classification commissionRate equals: commissionRate.
	schedule := employee schedule.
	self assert: schedule class equals: BiweekSchedule