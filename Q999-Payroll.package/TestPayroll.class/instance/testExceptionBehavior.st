tests
testExceptionBehavior

	| raisedException |
	
	[ CannotHandleTimeCardClassificationException signal: 'Test Exception.' ]
		on: CannotHandleTimeCardClassificationException
		do: [ :e | 
			raisedException := e.
		].

	self assert: raisedException messageText equals: 'Test Exception.'.
