tests
testPushOffButton

	| fan remoteControl fanOnCommand stereo fanSlot stereoVolumeUpCommand stereoSlot initStatus initVolume fanOffCommand stereoVolumeDownCommand |
	"Arrange"
	fan := Fan new.
	stereo := Stereo new.
	remoteControl := RemoteControl new.

	fanSlot := 0.
	fanOnCommand := FanOnCommand receiver: fan.
	fanOffCommand := FanOffCommand receiver: fan.
	remoteControl
		slot: fanSlot
		onCommand: fanOnCommand
		offCommand: fanOffCommand.
	initStatus := #off.
	self assert: fan status equals: initStatus.

	stereoSlot := 1.
	stereoVolumeUpCommand := StereoVolumeUpCommand receiver: stereo.
	stereoVolumeDownCommand := StereoVolumeDownCommand receiver: stereo.
	remoteControl
		slot: stereoSlot
		onCommand: stereoVolumeUpCommand
		offCommand: stereoVolumeDownCommand.
	initVolume := 5.
	self assert: stereo volume equals: initVolume.

	remoteControl pushOnButton: fanSlot.
	remoteControl pushOnButton: stereoSlot.

	self assert: fan status equals: #on.
	self assert: stereo volume equals: 6.

	"Act"
	remoteControl pushOffButton: fanSlot.
	remoteControl pushOffButton: stereoSlot.

	"Assert"
	self assert: fan status equals: #off.
	self assert: stereo volume equals: initVolume 