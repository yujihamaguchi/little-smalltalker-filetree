execution
execute

	| e |
	e := PayrollDatabase employee: empId.
	e ifNotNil: [ e method: self method ]