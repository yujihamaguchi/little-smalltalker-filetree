tests
testRezult

	test := BkWasRun name: 'testMethod'.
	test run: result.
	TestCase new assert: result summary equals: '1 run, 0 failed'