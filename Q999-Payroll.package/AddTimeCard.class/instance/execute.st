execution
execute

	| employee classification timeCard |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ Exception signal: 'No such employee. id: ' , empId ].

	classification := employee classification.
	timeCard := TimeCard date: date hours: hours.
	classification addTimeCard: timeCard