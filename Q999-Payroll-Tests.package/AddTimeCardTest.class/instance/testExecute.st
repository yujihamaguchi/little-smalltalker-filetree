tests
testExecute

	| transaction empId date hours employee classification timecard |
	"Arrange"
	empId := Mock new.
	date := Mock new.
	hours := Mock new.

	employee := Mock new.
	(PayrollDatabase stub employeeWithId: empId) willReturn: employee.
	classification := Mock new.
	classification stub class willReturn: HourlyClassification.
	employee stub classification willReturn: classification.
	timecard := Mock new.
	(TimeCard stub date: date hours: hours) willReturn: timecard.

	"Act"
	transaction := AddTimeCard empId: empId date: date hours: hours.
	transaction execute.

	"Assert"
	PayrollDatabase should receive employeeWithId: empId.
	employee should receive classification.
	TimeCard should receive date: date hours: hours.
	classification should receive addTimeCard: timecard