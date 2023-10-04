as yet unclassified
calculateDeductions: aPaycheck

	| filterdServiceCharges totalServiceCharge numberOfFridays totalDues |
	serviceCharges := self serviceCharges.
	filterdServiceCharges := serviceCharges
		                         between: aPaycheck startDate
		                         and: aPaycheck endDate.
	totalServiceCharge := filterdServiceCharges totalAmount.
	numberOfFridays := self
		                   numberOfFridaysBetween: aPaycheck startDate
		                   and: aPaycheck endDate.
	dues := self dues.
	totalDues := numberOfFridays * dues.
	^ totalServiceCharge + totalDues