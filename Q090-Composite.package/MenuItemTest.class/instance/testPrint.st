tests
testPrint
	| target |
	target := MenuItem name: 'foo'.
	self assert: target print equals: 'foo'