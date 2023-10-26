execution
execute

	| employee classification timecard |
	employee := PayrollDatabase employeeWithId: empId.
	Transcript show: employee class name; cr.
	employee ifNil: [ Exception signal: 'No such employee. id: ' , empId ].
	classification := employee classification.
	Transcript show: classification class name; cr.
	timecard := TimeCard date: date hours: hours.
	classification addTimecard: timecard