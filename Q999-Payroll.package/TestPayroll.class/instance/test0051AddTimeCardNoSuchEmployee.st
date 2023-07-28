tests
test0051AddTimeCardNoSuchEmployee

	| empId t raisedError |
	empId := 999.

	t := AddTimeCard empId: empId date: 20230518 hours: 8.

	raisedError := nil.
	[ t execute ]
		on: Error
		do: [ :e | raisedError := e ].
	self assert: raisedError notNil.
	self assert: raisedError messageText equals: 'No such employee'