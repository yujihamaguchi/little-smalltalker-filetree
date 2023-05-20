adding
addEmployee: anObject id: aNumber
	employees := employees ifNil: [ employees := Dictionary new ].
	employees at: aNumber put: anObject 