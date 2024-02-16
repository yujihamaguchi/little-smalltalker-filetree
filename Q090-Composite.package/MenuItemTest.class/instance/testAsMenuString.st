tests
testAsMenuString

	| target |
	target := MenuItem title: 'foo'.
	self assert: target asMenuString equals: 'foo'