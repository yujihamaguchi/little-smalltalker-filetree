execution
execute

	| employee classification timeCard |
	employee := PayrollDatabase employeeWithId: empId.
	Transcript show: employee class name; cr.
	employee ifNil: [ Exception signal: 'No such employee. id: ' , empId ].
	classification := employee classification.
	Transcript show: classification class name; cr.
	timeCard := TimeCard date: date hours: hours.
	classification addTimeCard: timeCard