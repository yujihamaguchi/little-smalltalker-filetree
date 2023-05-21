tests
testChangeMemberTransaction

	| empId cmt e t |
	empId := 1.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.

	t execute.

	cmt := ChangeMemberTransaction empId: empId dues: 10.
	cmt execute.
	e := PayrollDatabase employee: empId.
	self assert: e affiliation class equals: UnionAffiliation.
	self assert: e affiliation dues equals: 10