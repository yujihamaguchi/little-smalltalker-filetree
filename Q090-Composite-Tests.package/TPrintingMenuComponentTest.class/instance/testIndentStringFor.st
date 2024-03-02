tests
testIndentStringFor

	| menuComponent depthNumber indentString tempMenuComponentClass |
	"Arrange"
	tempMenuComponentClass := Object
		                          subclass: #TempMenuComponentClass
		                          uses: TPrintingMenuComponent
		                          instanceVariableNames: ''
		                          classVariableNames: ''
		                          package: 'Q090-Composite'.
	menuComponent := tempMenuComponentClass new.
	depthNumber := 2.

	"Act"
	indentString := menuComponent indentStringFor: depthNumber.

	"Assert"
	self assert: indentString equals: '    '.

	tempMenuComponentClass removeFromSystem