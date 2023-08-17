tests
testRun
	| test |
	test := WasRun name: 'testMethod'.
	self assert: test wasRun isNil.
	test run.
	self assert: test wasRun equals: 1
	