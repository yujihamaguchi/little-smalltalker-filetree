running
run

	| result |
	result := MyTestResult new initialize.
	result testStarted.
	self setUp.
	[ self perform: name asSymbol ]
		on: Error
		do: [ :e | result testFailed ].
	self tearDown.
	^ result