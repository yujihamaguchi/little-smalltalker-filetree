tests
testTitleForPrinting

	| menuItem depthNumber titleForPrinting title indentString |
	"Arrange"
	title := 'aMenuItem'.
	menuItem := MenuItem title: title.

	depthNumber := Mock new.
	indentString := '  '.
	(menuItem stub indentStringFor: depthNumber) willReturn: indentString.

	"Act"
	titleForPrinting := menuItem titleForPrinting: depthNumber.

	"Assert"
	self assert: titleForPrinting equals: indentString, title