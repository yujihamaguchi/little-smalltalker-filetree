tests
testPushButtonOfCommandUnassignedSlot

	| raisedException slotIndex remoteControl |
	"Arrange"
	slotIndex := 0.
	remoteControl := RemoteControl new.

	"Act"
	[ remoteControl pushOnButton: slotIndex ]
		on: Exception
		do: [ :e | raisedException := e messageText ].

	"Assert"
	self
		assert: raisedException
		equals: 'Any command is not assigned at slot: ' , slotIndex asString