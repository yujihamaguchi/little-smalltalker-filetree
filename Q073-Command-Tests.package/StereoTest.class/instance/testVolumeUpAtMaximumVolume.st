tests
testVolumeUpAtMaximumVolume

	| stereo maximumVolume |
	"Arrange"
	stereo := Stereo new.
	maximumVolume := stereo defaultVolume.
	stereo stub maximumVolume willReturn: maximumVolume.
	self assert: stereo volume equals: maximumVolume.

	"Act"
	stereo volumeUp.

	"Assert"
	self assert: stereo volume equals: maximumVolume