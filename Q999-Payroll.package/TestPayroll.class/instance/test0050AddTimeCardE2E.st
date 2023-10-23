tests
test0050AddTimeCardE2E

	"
	[ UseCase3: Request for timecard processing ]
	- TimeCard <EmpID> <date> <hours>
	
	Attachment 1: In the case where the selected employee is not paid by the hour.
	  Output an error message only, and perform no further processing.
	"

	| empId transaction employee classification timecard name address hourlyRate date hours |
	"Arrange"
	empId := 123.
	name := 'Bill'.
	address := 'Home'.
	hourlyRate := 15.
	date := 20230518.
	hours := 8.

	transaction := AddHourlyEmployee
		               empId: empId
		               name: name
		               address: address
		               hourlyRate: hourlyRate.

	transaction execute.

	"Act"
	transaction := AddTimeCard empId: empId date: date hours: hours.

	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.

	classification := employee classification.
	timecard := classification timecardAt: date.
	self deny: timecard isNil.
	self assert: timecard class equals: TimeCard.
	self assert: timecard hours equals: hours