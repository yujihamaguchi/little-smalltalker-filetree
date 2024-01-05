tests
testPushUndoButton

	| remoteControl fanSlot fan fanOnCommand initStatus fanOffCommand |
	"Arrange"
	fanSlot := 0.
	initStatus := #off.
	fan := Fan new.
	self assert: fan status equals: initStatus.

	fanOnCommand := FanOnCommand receiver: fan.
	fanOffCommand := FanOffCommand receiver: fan.
	remoteControl := RemoteControl new
		                 slot: fanSlot
		                 onCommand: fanOnCommand
		                 offCommand: fanOffCommand.

	remoteControl pushOnButton: fanSlot.
	self assert: fan status equals: #on.

	"Act"
	remoteControl pushUndoButton.

	"Assert"
	self assert: fan status equals: initStatus