tests
test0021AddHourlyEmployee

	| empId name address houlyRate transaction employee classification schedule method timeCards |
	"Arrange"
	empId := Mock new.
	name := Mock new.
	address := Mock new.
	houlyRate := Mock new.
	timeCards := Mock new.

	employee := Mock new.
	(Employee stub id: empId name: name address: address) willReturn:
		employee.
	TimeCards stub new willReturn: timeCards.
	classification := Mock new.
	(HourlyClassification stub rate: houlyRate timeCards: timeCards) 
		willReturn: classification.

	schedule := Mock new.
	WeeklySchedule stub new willReturn: schedule.

	method := Mock new.
	HoldMethod stub new willReturn: method.

	(PayrollDatabase stub addEmployee: employee) willReturnYourself.

	"Act"
	transaction := AddHourlyEmployee
		               empId: empId
		               name: name
		               address: address
		               hourlyRate: houlyRate.

	transaction execute.

	"Assert"
	Employee should receive id: empId name: name address: address.
	TimeCards should receive new.
	HourlyClassification should receive
		rate: houlyRate
		timeCards: timeCards.
	employee should receive classification: classification.
	WeeklySchedule should receive new.
	employee should receive schedule: schedule.
	HoldMethod should receive new.
	employee should receive method: method.
	PayrollDatabase should receive addEmployee: employee