tests
testChangeNameTransaction

	| empId t e cnt |
	empId := 1.
	t := AddHourlyEmployee
		     empId: empId
		     name: 'Bill'
		     address: 'Home'
		     hourlyRate: 10.

	t execute.

	cnt := ChangeNameTransaction empId: empId name: 'Bob'.
	cnt execute.

	e := PayrollDatabase employee: empId.

	self deny: e isNil.
	self assert: e name equals: 'Bob'