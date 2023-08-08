execution
execute

	| employee classification timecard |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ 
		^ Error signal:
			  ('No such employee. empId: {1}' format: { empId asString }) ].
	classification := employee classification.
	classification class = HourlyClassification ifFalse: [ 
		^ Error signal:
			  ('Tried to add timecard to non-hourly employee: {1}' format:
				   { classification class asString }) ].
	timecard := TimeCard date: date hours: hours.
	classification addTimecard: timecard