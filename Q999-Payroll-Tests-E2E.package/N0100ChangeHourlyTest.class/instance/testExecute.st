tests
testExecute

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/7de7de292bf02e838e78c4723b571b6aa0eea42c/Q999-Payroll.package/TestPayroll.class/instance
"

	| empId employee classification hourlyRate transaction schedule |
	"Arrange"
	empId := 123.
	hourlyRate := 12.

	transaction := AddSalariedEmployee
		               empId: empId
		               name: 'Bob'
		               address: 'NY'
		               salary: 10.
	transaction execute.

	"Action"
	transaction := ChangeHourly empId: empId hourlyRate: hourlyRate.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.

	classification := employee classification.
	self assert: classification class equals: HourlyClassification.
	self assert: classification rate equals: hourlyRate.

	schedule := employee schedule.
	self assert: schedule class equals: WeeklySchedule