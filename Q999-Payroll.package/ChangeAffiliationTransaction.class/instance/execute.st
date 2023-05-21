execution
execute

	| e |
	e := PayrollDatabase employee: empId.
	e ifNotNil: [
		self recordMembership: e.
		e affiliation: self affiliation ]