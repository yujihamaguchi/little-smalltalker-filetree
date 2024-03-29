printing
printList: anArray

	^ (anArray sorted: self createComparator) asString