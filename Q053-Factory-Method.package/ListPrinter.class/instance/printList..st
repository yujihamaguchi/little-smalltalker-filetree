printing
printList: anArray

	| comparator sortedArray |
	comparator := self createComparator.
	sortedArray := anArray sortedUsing: comparator.
	^ sortedArray asString