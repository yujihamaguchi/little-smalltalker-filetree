tests
testExecute

	| target fan |
	fan := Mock new.
	target := FanOnCommand fan: fan.

	target execute.

	fan should receive on once