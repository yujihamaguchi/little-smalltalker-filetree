tests
testPushButton

	| fan remoteControl fanOnCommand stereo slot0Index stereoVolumeUpCommand slot1Index initStatus initVolume fanOffCommand stereoVolumeDownCommand |
	"Arrange"
	fan := Fan new.
	stereo := Stereo new.
	remoteControl := RemoteControl new.

	slot0Index := 0.
	fanOnCommand := FanOnCommand receiver: fan.
	fanOffCommand := FanOffCommand receiver: fan.
	remoteControl
		slot: slot0Index
		onCommand: fanOnCommand
		offCommand: fanOffCommand.
	initStatus := #off.
	self assert: fan status equals: initStatus.

	slot1Index := 1.
	stereoVolumeUpCommand := StereoVolumeUpCommand receiver: stereo.
	stereoVolumeDownCommand := StereoVolumeDownCommand receiver: stereo.
	remoteControl
		slot: slot1Index
		onCommand: stereoVolumeUpCommand
		offCommand: stereoVolumeDownCommand.
	initVolume := 5.
	self assert: stereo volume equals: initVolume.

	"Act"
	remoteControl pushOnButton: slot0Index.
	remoteControl pushOnButton: slot1Index.

	"Assert"
	self assert: fan status equals: #on.
	self assert: stereo volume equals: 6.

	"Act"
	remoteControl pushOffButton: slot0Index.
	remoteControl pushOffButton: slot1Index.

	"Assert"
	self assert: fan status equals: #off.
	self assert: stereo volume equals: 5