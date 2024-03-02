tests
testIndentStringFor

	| menuComponent depthNumber indentString |
	"Arrange"
	menuComponent := tempMenuComponentClass new.
	depthNumber := 2.

	"Act"
	indentString := menuComponent indentStringFor: depthNumber.

	"Assert"
	self assert: indentString equals: '    '