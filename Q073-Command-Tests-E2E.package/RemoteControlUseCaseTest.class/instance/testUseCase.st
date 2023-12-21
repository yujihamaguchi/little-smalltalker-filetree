tests
testUseCase

	| fan stereo remoteControl fanOnCommand slot |
	"Arrange"
	fan := Fan new.
	stereo := Stereo new.
	remoteControl := RemoteControl new.

	fanOnCommand := FanOnCommand receiver: fan.
	slot := 0.
	remoteControl slot: slot onCommand: fanOnCommand.

	"Act"
	remoteControl pushOnButton: slot.

	"Assert"
	self assert: fan status equals: #on.
	self assert: stereo status equals: #off