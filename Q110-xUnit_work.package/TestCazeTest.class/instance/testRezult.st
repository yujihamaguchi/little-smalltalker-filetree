tests
testRezult

	| result |
	test := WasRun name: 'testMethod'.
	result := test run.
	TestCase new assert: result summary equals: '1 run, 0 failed'