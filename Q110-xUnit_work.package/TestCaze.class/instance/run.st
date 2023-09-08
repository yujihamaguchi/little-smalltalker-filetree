running
run

	| result |
	result := TestRezult new.
	result testStarted.
	self setUp.
	[ self perform: name asSymbol ]
		on: Exception
		do: [ result testFailed ].
	self tearDown.
	^ result