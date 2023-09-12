tests
testRezult

	| test |
	"Arrange"
	test := WasRun name: 'testMethod'.
	"Act"
	result := test run: result.
	"Assert"
	TestCase new assert: result summary equals: '1 run, 0 failed'