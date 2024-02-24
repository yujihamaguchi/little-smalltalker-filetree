tests
testIndent

	| menuItem indentString depthNumber |
	"Arrange"
	menuItem := MenuItem new.
	depthNumber := 3.

	"Act"
	indentString := menuItem indent: depthNumber.

	"Assert"
	self assert: (' ' repeat: 6) equals: indentString