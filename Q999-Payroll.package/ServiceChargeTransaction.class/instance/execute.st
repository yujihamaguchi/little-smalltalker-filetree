execution
execute

	| sc e af |
	e := PayrollDatabase unionMember: memberId.
	e ifNil: [ Error signal: 'No such employee' ] ifNotNil: [
		af := e affiliation.
		af class = UnionAffiliation
			ifTrue: [
				sc := ServiceCharge date: date amount: amount.
				af serviceCharge: sc ]
			ifFalse: [ Error signal: 'must be UnionAffiliation' ] ]