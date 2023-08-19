tests
test0100ChangeHourly

	| employee inputRate inputEmpId transaction hourlyClassification weeklySchedule |
	"Arrange"
	inputEmpId := Mock new.
	inputRate := Mock new.
	employee := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn:
		employee.
	hourlyClassification := Mock new.
	(HourlyClassification stub hourlyRate: inputRate) willReturn:
		hourlyClassification.
	weeklySchedule := Mock new.
	WeeklyShedule stub new willReturn: weeklySchedule.

	"Action"
	transaction := ChangeHourly empId: inputEmpId hourlyRate: inputRate.
	transaction execute.

	"Assert"
	employee should receive classification: hourlyClassification.
	employee should receive schedule: weeklySchedule