tests
testAsPrintingString

	| titleForPrinting menuItem depthNumber result |
	"Arrange"
	menuItem := MenuItem new.
	depthNumber := Mock new.
	titleForPrinting := Mock new.
	(menuItem stub titleForPrinting: depthNumber) willReturn:
		titleForPrinting.

	"Act"
	result := menuItem asPrintingString: depthNumber.

	"Assert"
	menuItem should receive titleForPrinting: depthNumber.
	self assert: result equals: titleForPrinting