tests
testTemplateMethod

	| test |
	"Arrange"
	test := WasRun name: 'testMethod'.
	"Act"
	test run: result.
	"Assert"
	TestCase new assert: test log equals: 'setUp testMethod tearDown '