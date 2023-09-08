tests
testFailedResultFormatting

	result testStarted.
	result testFailed.
	TestCase new assert: result summary equals: '1 run, 1 failed'