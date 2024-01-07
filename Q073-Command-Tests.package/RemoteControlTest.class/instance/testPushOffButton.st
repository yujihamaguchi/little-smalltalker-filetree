tests
testPushOffButton

	| slotIndex offCommand remoteControl onCommand |
	"Arrange"
	slotIndex := Mock new.
	onCommand := Mock new.
	offCommand := Mock new.
	offCommand stub execute willReturnYourself.
	remoteControl := RemoteControl new
		                 slot: slotIndex
		                 onCommand: onCommand
		                 offCommand: offCommand.

	"Act"
	remoteControl pushOffButton: slotIndex.

	"Assert"
	self assert: remoteControl undoCommand equals: onCommand.
	offCommand should receive execute