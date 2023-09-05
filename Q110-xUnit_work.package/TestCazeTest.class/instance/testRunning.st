tests
testRunning

	| test |
	"Arrange"
	test := WasRun name: 'testMethod'.
	"Assert"
	TestCase new assert: test wasRun isNil.
	test run.
	"Assert"
	TestCase new assert: test wasRun equals: 1