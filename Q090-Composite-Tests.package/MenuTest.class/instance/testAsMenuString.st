tests
testAsMenuString

	| menu depthNumber indentedTitle menuComponent1 menuComponent2 |
	"Arrange"
	menu := Menu new.
	depthNumber := 0.

	indentedTitle := Mock new.
	(menu stub indentedTitle: depthNumber) willReturn: indentedTitle.

	menuComponent1 := Mock new.
	menuComponent2 := Mock new.
	menu add: menuComponent1.
	menu add: menuComponent2.

	"Act"
	menu asMenuString: depthNumber.

	"Assert"
	menu should receive indentedTitle: depthNumber.
	menuComponent1 should receive asMenuString: depthNumber + 1.
	menuComponent2 should receive asMenuString: depthNumber + 1