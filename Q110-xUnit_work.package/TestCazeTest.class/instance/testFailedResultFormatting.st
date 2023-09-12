tests
testFailedResultFormatting

	"Act"
	result testStarted.
	result testFailed.
	"Assert"
	TestCase new assert: result summary equals: '1 run, 1 failed'