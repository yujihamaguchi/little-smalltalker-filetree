tests
test0050AddTimeCard

	"
	[ UseCase3: Request for timecard processing ]
	- TimeCard <EmpID> <date> <hours>
	
	Attachment 1: In the case where the selected employee is not paid by the hour.
	  Output an error message only, and perform no further processing.
	"

	| empId t tct e hc tc |
	empId := 2.

	t := AddHourlyEmployee
		     empId: empId
		     name: 'Bill'
		     address: 'Home'
		     hourlyRate: 15.

	t execute.

	tct := AddTimeCard empId: empId date: 20230518 hours: 8.

	tct execute.

	e := PayrollDatabase employeeWithId: empId.

	hc := e classification.
	self deny: hc isNil.
	self assert: hc class equals: HourlyClassification.

	tc := hc timecardAt: 20230518.
	self deny: tc isNil.
	self assert: tc class equals: TimeCard.
	self assert: tc hours equals: 8