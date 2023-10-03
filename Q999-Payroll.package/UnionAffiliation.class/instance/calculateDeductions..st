as yet unclassified
calculateDeductions: aPaycheck

	| aServiceCharges targetServiceCharges totalServiceCharge aDues numberOfFridays totalDues |
	aServiceCharges := self serviceCharges.
	targetServiceCharges := aServiceCharges
		                        between: aPaycheck startDate
		                        and: aPaycheck endDate.
	totalServiceCharge := targetServiceCharges totalAmount.
	numberOfFridays := self
		                   numberOfFridaysBetween: aPaycheck startDate
		                   and: aPaycheck endDate.
	aDues := self dues.
	totalDues := numberOfFridays * aDues.
	^ totalServiceCharge + totalDues