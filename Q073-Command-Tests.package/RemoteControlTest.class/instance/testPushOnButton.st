tests
testPushOnButton

	| remoteControl slotIndex onCommand offCommand |
	"Arrange"
	slotIndex := Mock new.
	onCommand := Mock new.
	offCommand := Mock new.
	onCommand stub execute willReturnYourself.
	remoteControl := RemoteControl new
		                 slot: slotIndex
		                 onCommand: onCommand
		                 offCommand: offCommand.

	"Act"
	remoteControl pushOnButton: slotIndex.

	"Assert"
	self assert: remoteControl undoCommand equals: offCommand.
	onCommand should receive execute