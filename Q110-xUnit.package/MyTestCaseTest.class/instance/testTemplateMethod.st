tests
testTemplateMethod

	| test |
	test := WasRun name: 'testMethod'.
	test run: result.
	TestCase new assert: test log equals: 'setUp testMethod tearDown '