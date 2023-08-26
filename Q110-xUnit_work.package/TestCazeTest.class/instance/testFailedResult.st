tests
testFailedResult

	| result |
	test := WasRun name: 'testBrokenMethod'.
	result := test run.
	TestCase new assert: result summary equals: '1 run, 1 failed'