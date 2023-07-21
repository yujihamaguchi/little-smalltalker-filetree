tests
test0160ChangeMember

	| empId cmt e t af memberId m |
	empId := 1.
	memberId := 10.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.

	t execute.

	cmt := ChangeMemberTransaction
		       empId: empId
		       memberId: memberId
		       dues: 20.
	cmt execute.
	e := PayrollDatabase employee: empId.
	self deny: e isNil.
	af := e affiliation.
	self deny: af isNil.
	self assert: af class equals: UnionAffiliation.
	self assert: af dues equals: 20.

	m := PayrollDatabase unionMember: memberId.
	self deny: m isNil.
	self assert: e equals: m