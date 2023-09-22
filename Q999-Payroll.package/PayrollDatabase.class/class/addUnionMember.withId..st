adding
addUnionMember: anEmployee withId: aMemberId

	affiliations ifNil: [ affiliations := Dictionary new ].
	affiliations at: aMemberId put: anEmployee