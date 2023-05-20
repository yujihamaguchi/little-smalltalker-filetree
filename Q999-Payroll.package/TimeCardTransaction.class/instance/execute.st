execution
execute

	| e hc tc |
	e := PayrollDatabase employee: empId.
	e ifNil: [ Error signal: 'No such employee.' ] ifNotNil: [
		hc := e classification.
		hc class = HourlyClassification
			ifTrue: [
				tc := TimeCard date: date hours: hours.
				hc addTimecard: tc ]
			ifFalse: [
			Error signal: 'Tried to add timecard to non-hourly employee.' ] ]