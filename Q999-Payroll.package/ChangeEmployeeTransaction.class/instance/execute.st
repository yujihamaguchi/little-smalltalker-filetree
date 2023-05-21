execution
execute

	| e |
	e := PayrollDatabase employee: empId.
	e ifNotNil: [ self changeEmployee: e ]