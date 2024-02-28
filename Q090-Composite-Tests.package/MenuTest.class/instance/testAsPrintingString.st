tests
testAsPrintingString

	| menu depthNumber titleForPrinting subComponentsForPrinting |
	"Arrange"
	menu := Menu new.
	depthNumber := 0.

	titleForPrinting := Mock new.
	(menu stub titleForPrinting: depthNumber) willReturn:
		titleForPrinting.

	subComponentsForPrinting := Mock new.
	(menu stub subComponentsForPrinting: depthNumber + 1) willReturn:
		subComponentsForPrinting.

	"Act"
	menu asPrintingString: depthNumber.

	"Assert"
	menu should receive titleForPrinting: depthNumber.
	menu should receive subComponentsForPrinting: depthNumber + 1