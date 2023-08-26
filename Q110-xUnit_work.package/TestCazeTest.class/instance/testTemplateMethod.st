tests
testTemplateMethod

	test := WasRun name: 'testMethod'.
	test run.
	TestCase new assert: test log equals: 'setUp testMethod tearDown '