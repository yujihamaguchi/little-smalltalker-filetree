execution
execute

	| employee classification timecard |
	employee := PayrollDatabase employee: empId.
	classification := employee classification.
	timecard := TimeCard date: date hours: hours.
	classification addTimecard: timecard