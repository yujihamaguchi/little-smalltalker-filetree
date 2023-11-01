adding
add: aSalesReceipt

	salesReceipts ifNil: [ salesReceipts := Dictionary new ].
	^ salesReceipts at: aSalesReceipt date put: aSalesReceipt