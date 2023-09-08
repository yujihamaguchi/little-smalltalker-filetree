adding
add: aTestCase

	testCases ifNil: [ testCases := OrderedCollection new ].
	testCases add: aTestCase