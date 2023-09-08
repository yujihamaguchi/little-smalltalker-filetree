tests
testFailedResult

	test := BkWasRun name: 'testBrokenMethod'.
	test run: result.
	TestCase new assert: result summary equals: '1 run, 1 failed'