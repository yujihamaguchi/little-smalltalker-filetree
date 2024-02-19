tests
testAsMenuString

	| title menuItem depthNumber |
	"Arrange"
	title := Mock new.
	menuItem := MenuItem title: title.
	menuItem stub title willReturn: title.
	
	depthNumber := 1.
	
	"Act"
	menuItem asMenuString: depthNumber.

	"Assert"
	menuItem should receive title



















	"	| target |
	target := MenuItem title: 'foo'.
	self assert: target asMenuString equals: 'foo'"