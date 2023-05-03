tests
testAsMenuString

	| target |
	target := MenuItem name: 'foo'.
	self assert: target asMenuString equals: 'foo'