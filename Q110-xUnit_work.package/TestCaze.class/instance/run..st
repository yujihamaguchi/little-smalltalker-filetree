running
run: aTestRezult

	aTestRezult testStarted.
	self setUp.
	[ self perform: name asSymbol ]
		on: Exception
		do: [ aTestRezult testFailed ].
	self tearDown.
	^ aTestRezult