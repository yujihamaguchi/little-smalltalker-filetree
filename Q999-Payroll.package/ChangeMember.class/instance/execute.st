execution
execute

	| employee |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ 
		Exception signal: 'No such employee. id: ' , empId asString ].
	employee affiliation:
		(UnionAffiliation memberId: memberId dues: dues).
	PayrollDatabase addUnionMember: employee withId: memberId