tests
testSubComponentsForPrinting

	| menu depthNumber component1 component2 |
	"Arrange"
	menu := Menu new.
	depthNumber := Mock new.
	
	component1 := Mock new.
	(component1 stub asPrintingString: depthNumber) willReturnYourself.
	component2 := Mock new.
	(component2 stub asPrintingString: depthNumber) willReturnYourself.
	menu add: component1.
	menu add: component2.
	"Act"
	menu subComponentsForPrinting: depthNumber.

	"Assert"
	component1 should receive asPrintingString: depthNumber.
	component2 should receive asPrintingString: depthNumber