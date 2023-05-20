adding
addSalesReceipt: aSalesReceipt

	salesReceipts := salesReceipts ifNil: [
		                 salesReceipts := Dictionary new ].
	salesReceipts at: aSalesReceipt date put: aSalesReceipt