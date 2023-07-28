tests
test0050TimeCardTransaction

	"
	[ UseCase3: Request for timecard processing ]
	- TimeCard <EmpID> <date> <hours>
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

	e := PayrollDatabase employee: empId.

	hc := e classification.
	self deny: hc isNil.
	self assert: hc class equals: HourlyClassification.

	tc := hc timecardAt: 20230518.
	self deny: tc isNil.
	self assert: tc class equals: TimeCard.
	self assert: tc hours equals: 8