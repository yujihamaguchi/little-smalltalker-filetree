tests
testMute

	| remote radio |
	"Arrange"
	radio := Radio new.
	remote := AdvancedRemote device: radio.
	radio volume: 10.

	"Act"
	remote mute.

	"Assert"
	self assert: radio volume equals: 0