tests
testSetUp

	| test |
	"Arrange"
	test := WasRun name: 'testMethod'.
	"Act"
	test run.
	"Assert"
	TestCase new assert: test wasSetUp equals: 1