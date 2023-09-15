tests
test0112ChangeSalariedE2E

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/7de7de292bf02e838e78c4723b571b6aa0eea42c/Q999-Payroll.package/TestPayroll.class/instance
"

	| schedule classification inputSalary inputEmpId employee transaction |
	"Arrange"
	inputEmpId := Mock new.
	inputSalary := Mock new.
	transaction := AddHourlyEmployee
		               empId: inputEmpId
		               name: ''
		               address: ''
		               hourlyRate: 0.
	transaction execute.

	"Act"
	transaction := ChangeSalaried empId: inputEmpId salary: inputSalary.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: inputEmpId.
	schedule := employee schedule.
	self deny: schedule isNil.
	self assert: schedule class equals: MonthlySchedule.
	classification := employee classification.
	self deny: classification isNil.
	self assert: classification class equals: SalariedClassification.
	self assert: classification salary equals: inputSalary