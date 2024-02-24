tests
testAsMenuString

	| title menuItem depthNumber indent |
	"Arrange"
	
	title := Mock new.
	menuItem := MenuItem title: title.
	menuItem stub title willReturn: title.
	
	depthNumber := Mock new.
	(menuItem stub indent: depthNumber) willReturn: Mock new.
		
	"Act"
	menuItem asMenuString: depthNumber.

	"Assert"
	menuItem should receive indent: depthNumber.
	menuItem should receive title



















	"	| target |
	target := MenuItem title: 'foo'.
	self assert: target asMenuString equals: 'foo'"