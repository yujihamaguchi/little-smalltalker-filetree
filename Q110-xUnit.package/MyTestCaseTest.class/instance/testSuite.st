tests
testSuite

	| suite |
	suite := MyTestSuite new.
	suite add: (WasRun name: 'testMethod').
	suite add: (WasRun name: 'testBrokenMethod').
	suite run: result.
	TestCase new assert: result summary equals: '2 run, 1 failed'