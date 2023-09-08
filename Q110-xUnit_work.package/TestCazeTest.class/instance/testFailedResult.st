tests
testFailedResult

	| test result |
	"Arrange"
	test := WasRun name: 'testBrokenMethod'.
	"Act"
	result := test run.
	"Assert"
	TestCase new assert: result summary equals: '1 run, 1 failed'