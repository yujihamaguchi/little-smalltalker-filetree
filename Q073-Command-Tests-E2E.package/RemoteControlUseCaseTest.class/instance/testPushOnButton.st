tests
testPushOnButton

	| fan remoteControl fanOnCommand stereo fanSlot stereoVolumeUpCommand stereoSlot initStatus initVolume |
	"Arrange"
	fan := Fan new.
	stereo := Stereo new.
	remoteControl := RemoteControl new.

	fanSlot := 0.
	fanOnCommand := FanOnCommand receiver: fan.
	remoteControl slot: fanSlot onCommand: fanOnCommand offCommand: nil.
	initStatus := #off.
	self assert: fan status equals: initStatus.

	stereoSlot := 1.
	stereoVolumeUpCommand := StereoVolumeUpCommand receiver: stereo.
	remoteControl
		slot: stereoSlot
		onCommand: stereoVolumeUpCommand
		offCommand: nil.
	initVolume := 5.
	self assert: stereo volume equals: initVolume.

	"Act"
	remoteControl pushOnButton: fanSlot.
	remoteControl pushOnButton: stereoSlot.

	"Assert"
	self assert: fan status equals: #on.
	self assert: stereo volume equals: initVolume + 1