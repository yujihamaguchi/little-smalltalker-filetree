execution
execute

	| employee |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ 
		Exception signal: 'No such employee. id: ' , empId asString ].
	employee classification: (SalariedClassification salary: salary).
	employee schedule: MonthlySchedule new