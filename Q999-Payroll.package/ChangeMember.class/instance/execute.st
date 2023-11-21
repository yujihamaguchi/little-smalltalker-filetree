execution
execute

	| employee affilication |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ 
		Exception signal: 'No such employee. id: ' , empId asString ].
	affilication := UnionAffiliation
		                memberId: memberId
		                dues: dues
		                serviceCharges: ServiceCharges new.
	employee affiliation: affilication.
	PayrollDatabase addUnionMember: employee withId: memberId