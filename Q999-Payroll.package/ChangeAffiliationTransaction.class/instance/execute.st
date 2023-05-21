execution
execute

	| e |
	e := PayrollDatabase employee: empId.
	e ifNotNil: [ e affiliation: self affiliation ]