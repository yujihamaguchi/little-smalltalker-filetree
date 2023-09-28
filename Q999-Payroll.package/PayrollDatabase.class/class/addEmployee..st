actions
addEmployee: anEmployee

	employees ifNil: [ employees := Dictionary new ].
	employees at: anEmployee empId put: anEmployee