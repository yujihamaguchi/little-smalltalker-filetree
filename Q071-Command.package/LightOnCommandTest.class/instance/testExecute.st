tests
testExecute

	| target light |
	light := Mock new.

	target := LightOnCommand receiver: light.

	target execute.

	light should receive on