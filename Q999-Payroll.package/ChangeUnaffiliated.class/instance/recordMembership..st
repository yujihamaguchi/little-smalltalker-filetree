as yet unclassified
recordMembership: anEmployee

	| affiliation memberId |
	affiliation := anEmployee affiliation.
	memberId := affiliation memberId.
	PayrollDatabase removeUnionMemberWithId: memberId