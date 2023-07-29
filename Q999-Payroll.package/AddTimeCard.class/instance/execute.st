execution
execute

	| employee classification timecard |
	employee := PayrollDatabase employee: empId.
	employee ifNil: [ ^ Error signal: 'No such employee' ].
	classification := employee classification.
	classification class = HourlyClassification ifFalse: [ 
		^ Error signal: 'Tried to add timecard to non-hourly employee' ].
	timecard := TimeCard date: date hours: hours.
	classification addTimecard: timecard