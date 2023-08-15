execution
execute

	| employee |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ 
		Error signal: 'No such employee. id: ' , empId asString ].
	employee name: name