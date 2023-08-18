running
run: aTestResult

	aTestResult testStarted.
	self setUp.
	[ self perform: name asSymbol ]
		on: Error
		do: [ :e | aTestResult testFailed ].
	self tearDown.
