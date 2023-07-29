accessing
salesReceiptAt: aDateNumber
	^ salesReceipts at: aDateNumber ifAbsent: [ nil ]