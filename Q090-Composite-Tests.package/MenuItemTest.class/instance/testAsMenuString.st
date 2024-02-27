tests
testAsMenuString

	| indentedTitle menuItem depthNumber |
	"Arrange"
	indentedTitle := Mock new.
	menuItem := MenuItem new.
	depthNumber := Mock new.
	(menuItem stub indentedTitle: depthNumber) willReturn: indentedTitle.

	"Act"
	menuItem asMenuString: depthNumber.

	"Assert"
	menuItem should receive indentedTitle: depthNumber