running
run: aTestResult

	aTestResult testStarted.
	self setUp.
	[ self perform: name asSymbol ]
		on: Exception
		do: [ aTestResult testFailed ].
	self tearDown