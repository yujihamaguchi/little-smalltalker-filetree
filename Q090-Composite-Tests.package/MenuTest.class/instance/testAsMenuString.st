tests
testAsMenuString
	"refactoring idea: you can create Depth class which handles 'depthNumber'. for example, depth root(= 0) or depth down(= depthNumber + 1).."
	| menu depthNumber menuComponent1 menuComponent2 title |
	"Arrange"
	title := Mock new.
	menu := Menu title: title.
	menu stub title willReturn: title.

	menuComponent1 := Mock new.
	menuComponent2 := Mock new.

	menu add: menuComponent1.
	menu add: menuComponent2.

	"Act"
	depthNumber := 0.
	menu asMenuString: depthNumber.

	"Assert"
	menu should receive title.
	menuComponent1 should receive asMenuString: depthNumber + 1.
	menuComponent2 should receive asMenuString: depthNumber + 1