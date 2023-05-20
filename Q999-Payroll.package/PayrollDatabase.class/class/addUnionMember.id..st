adding
addUnionMember: anObject id: aIdNumber
	unionMembers := unionMembers ifNil: [ unionMembers := Dictionary new ].
	unionMembers at: aIdNumber put: anObject 
	