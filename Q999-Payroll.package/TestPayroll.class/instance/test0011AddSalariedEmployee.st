tests
test0011AddSalariedEmployee

	| empId name address employee salary transaction classification schedule method |
	"Arrange"
	empId := Mock new.
	name := Mock new.
	address := Mock new.
	salary := Mock new.

	employee := Mock new.
	(Employee stub id: empId name: name address: address) willReturn:
		employee.

	classification := Mock new.
	(SalariedClassification stub salary: salary) willReturn:
		classification.

	schedule := Mock new.
	MonthlySchedule stub new willReturn: schedule.

	method := Mock new.
	HoldMethod stub new willReturn: method.

	"Act"
	transaction := AddSalariedEmployee
		               empId: empId
		               name: name
		               address: address
		               salary: salary.
	transaction execute.

	"Assert"
	Employee should receive id: empId name: name address: address.
	SalariedClassification should receive salary: salary.
	employee should receive classification: classification.
	MonthlySchedule should receive new.
	employee should receive schedule: schedule.
	HoldMethod should receive new.
	employee should receive method: method