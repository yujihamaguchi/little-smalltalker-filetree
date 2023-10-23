execution
execute

	| employee classification timecard |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ Exception signal: 'No such employee. id: ' , empId ].
	classification := employee classification.
	classification class = HourlyClassification ifFalse: [ 
		Exception signal: 'Tried to add timecard to non-hourly employee: '
			, classification class asString ].
	timecard := TimeCard date: date hours: hours.
	classification addTimecard: timecard