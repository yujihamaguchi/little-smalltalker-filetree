execution
execute

	| employee classification timecard |
	employee := PayrollDatabase employee: empId.
	employee ifNil: [ Error signal: 'No such employee' ] ifNotNil: [ 
		classification := employee classification.
		timecard := TimeCard date: date hours: hours.
		classification addTimecard: timecard ]