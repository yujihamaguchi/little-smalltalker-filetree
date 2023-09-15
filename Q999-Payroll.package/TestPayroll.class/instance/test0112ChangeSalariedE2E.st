tests
test0112ChangeSalariedE2E

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