as yet unclassified
recordMembership: anEmployee

	| af |
	af := anEmployee affiliation.
	af class = UnionAffiliation ifTrue: [
		PayrollDatabase removeUnionMember: af memberId ]