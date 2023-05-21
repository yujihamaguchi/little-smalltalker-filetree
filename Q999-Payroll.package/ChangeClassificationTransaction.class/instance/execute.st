execution
execute

	| e c s |
	e := PayrollDatabase employee: empId.
	e ifNotNil: [
		c := self classification.
		e classification: c.
		s := self schedule.
		e schedule: s ]