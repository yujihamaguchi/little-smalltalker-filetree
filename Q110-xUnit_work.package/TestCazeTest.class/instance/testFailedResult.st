tests
testFailedResult

	| test |
	"Arrange"
	test := WasRun name: 'testBrokenMethod'.
	"Act"
	result := test run: result.
	"Assert"
	TestCase new assert: result summary equals: '1 run, 1 failed'