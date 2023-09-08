tests
testZuite

	| suite |
	suite := BkTestZuite new.
	suite add: (BkWasRun name: 'testMethod').
	suite add: (BkWasRun name: 'testBrokenMethod').
	suite run: result.
	TestCase new assert: result summary equals: '2 run, 1 failed'