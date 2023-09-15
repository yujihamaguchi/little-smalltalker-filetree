tests
test0120ChangeCommissioned

	| inputEmpId inputSalary inputCommissionRate transaction schedule employee classification |
	"Arrange"
	inputEmpId := Mock new.
	inputSalary := Mock new.
	inputCommissionRate := Mock new.

	employee := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn:
		employee.

	schedule := Mock new.
	BiweekSchedule stub new willReturn: schedule.

	classification := Mock new.
	(CommissionedClassification stub
		 salary: inputSalary
		 commissionRate: inputCommissionRate) willReturn: classification.

	"Act"
	transaction := ChangeCommissoned
		               empId: inputEmpId
		               salary: inputSalary
		               commissionRate: inputCommissionRate.
	transaction execute.

	"Assert"
	employee should receive schedule: schedule.
	employee should receive classification: classification