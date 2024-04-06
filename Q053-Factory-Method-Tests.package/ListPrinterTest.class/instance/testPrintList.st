tests
testPrintList

	| target list comparator sortedList result sortedListAsString |
	"Arrange"
	target := ListPrinter new.
	comparator := Mock new.
	target stub createComparator willReturn: comparator.
	list := Mock new.
	sortedList := Mock new.
	(list stub sortedUsing: comparator) willReturn: sortedList.
	sortedListAsString := Mock new.
	sortedList stub asString willReturn: sortedListAsString.

	"Act"
	result := target printList: list.

	"Assert"
	target should receive createComparator.
	list should receive sortedUsing: comparator.
	sortedList should receive asString.
	self assert: result equals: sortedListAsString