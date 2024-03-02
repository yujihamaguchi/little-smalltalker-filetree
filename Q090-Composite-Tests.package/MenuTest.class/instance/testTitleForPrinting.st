tests
testTitleForPrinting

	| titleForPrinting indentString title menu depthNumber |
	"Arrange"
	title := 'aMenu'.
	menu := Menu title: title.

	depthNumber := Mock new.
	indentString := '  '.
	(menu stub indentStringFor: depthNumber) willReturn: indentString.

	"Act"
	titleForPrinting := menu titleForPrinting: depthNumber.

	"Assert"
	self
		assert: titleForPrinting
		equals: indentString , '[' , title , ']' , String cr