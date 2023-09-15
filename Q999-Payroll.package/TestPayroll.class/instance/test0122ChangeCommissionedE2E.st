tests
test0122ChangeCommissionedE2E

	| inputEmpId inputSalary inputCommissionRate transaction employee classification schedule |
	"Arrange"
	inputEmpId := Mock new.
	inputSalary := Mock new.
	inputCommissionRate := Mock new.

	transaction := AddSalariedEmployee
		               empId: inputEmpId
		               name: 'Bob'
		               address: 'NY City'
		               salary: 0.
	transaction execute.

	"Act"
	transaction := ChangeCommissoned
		               empId: inputEmpId
		               salary: inputSalary
		               commissionRate: inputCommissionRate.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: inputEmpId.

	schedule := employee schedule.
	self assert: schedule class equals: BiweekSchedule.

	classification := employee classification.
	self assert: classification class equals: CommissionedClassification.
	self assert: classification salary equals: inputSalary.
	self
		assert: classification commissionRate
		equals: inputCommissionRate