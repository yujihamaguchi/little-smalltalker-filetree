tests
testPushOffButton

	| slotIndex offCommand remoteControl |
	"Arrange"
	slotIndex := Mock new.
	offCommand := Mock new.
	offCommand stub execute willReturnYourself.
	remoteControl := RemoteControl new
		                 slot: slotIndex
		                 onCommand: Mock new
		                 offCommand: offCommand.

	"Act"
	remoteControl pushOffButton: slotIndex.

	"Assert"
	offCommand should receive execute