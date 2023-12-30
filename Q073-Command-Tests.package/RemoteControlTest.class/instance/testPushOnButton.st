tests
testPushOnButton

	| remoteControl slotIndex onCommand |
	"Arrange"
	slotIndex := Mock new.
	onCommand := Mock new.
	onCommand stub execute willReturnYourself.
	remoteControl := RemoteControl new
		                 slot: slotIndex
		                 onCommand: onCommand
		                 offCommand: Mock new.

	"Act"
	remoteControl pushOnButton: slotIndex.

	"Assert"
	onCommand should receive execute