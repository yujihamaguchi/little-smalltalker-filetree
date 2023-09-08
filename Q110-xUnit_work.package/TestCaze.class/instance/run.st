running
run

	| result |
	result := TestRezult new.
	result testStarted.
	self setUp.
	self perform: name asSymbol.
	self tearDown.
	^ result