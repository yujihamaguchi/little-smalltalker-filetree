tests
test0102ChangeHourlyE2E

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/7de7de292bf02e838e78c4723b571b6aa0eea42c/Q999-Payroll.package/TestPayroll.class/instance
"

	| inputEmpId employee classification inputHourlyRate transaction schedule |
	"Arrange"
	inputEmpId := Mock new.
	inputHourlyRate := Mock new.
	transaction := AddSalariedEmployee
		               empId: inputEmpId
		               name: ''
		               address: ''
		               salary: 0.
	transaction execute.

	"Action"
	transaction := ChangeHourly
		               empId: inputEmpId
		               hourlyRate: inputHourlyRate.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: inputEmpId.
	schedule := employee schedule.
	self assert: schedule class equals: WeeklySchedule.
	classification := employee classification.
	self assert: classification class equals: HourlyClassification.
	self assert: classification hourlyRate equals: inputHourlyRate