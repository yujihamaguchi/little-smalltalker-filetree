execution
execute

	| employee classification schedule |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ 
		Error signal: 'No such employee. id: ' , empId asString ].
	schedule := MonthlySchedule new.
	employee schedule: schedule.
	classification := SalariedClassification salary: salary.
	employee classification: classification