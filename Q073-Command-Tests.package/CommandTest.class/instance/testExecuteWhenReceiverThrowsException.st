tests
testExecuteWhenReceiverThrowsException

	| command raisedException raisedExceptoin |

	
	"Act"
	[ command execute ]
		on: Exception
		do: [ :e | raisedException := e ].

	"Assert"
	self
		assert: raisedExceptoin messageText
		equals: 'Command failed because stereo is broken'
