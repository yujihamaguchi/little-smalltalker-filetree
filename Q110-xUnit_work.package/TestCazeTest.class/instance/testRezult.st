tests
testRezult

	| test result |
	"Arrange"
	test := WasRun name: 'testMethod'.
	"Act"
	result := test run.
	"Assert"
	TestCase new assert: result summary equals: '1 run, 0 failed'