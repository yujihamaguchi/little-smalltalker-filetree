tests
testVolumeDownAtMinimumVolume

	| stereo minimumVolume |
	"Arrange"
	stereo := Stereo new.
	minimumVolume := stereo defaultVolume.
	stereo stub minimumVolume willReturn: minimumVolume.
	self assert: stereo volume equals: minimumVolume.

	"Act"
	stereo volumeDown.

	"Assert"
	self assert: stereo volume equals: minimumVolume