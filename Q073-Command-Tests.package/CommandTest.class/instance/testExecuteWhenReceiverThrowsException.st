tests
testExecuteWhenReceiverThrowsException

	| command raisedException stereo exception messageText |
	"Arrange"
	exception := Exception new.
	messageText := 'volume is already at maximum'.
	exception stub messageText willReturn: messageText.

	stereo := Mock new.
	stereo stub volumeUp willRaise: exception.

	command := StereoVolumeUpCommand receiver: stereo.
	
	"Act"
	[ command execute ]
		on: Exception
		do: [ :e | raisedException  := e ].

	"Assert"
	self
		assert: raisedException messageText
		equals: 'Command failed because ', messageText 
