tests
testRunning
	| test |
	test := WasRun name: 'testMethod'.
	TestCase new assert: test wasRun isNil.
	test run.
	TestCase new assert: test wasRun equals: 1