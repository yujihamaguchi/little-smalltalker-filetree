as yet unclassified
payday: aPayCheck

	| grossPay deductions |
	grossPay := self classification calculatePay: aPayCheck.
	deductions := self affiliation calculateDeductions: aPayCheck.
	aPayCheck grossPay: grossPay.
	aPayCheck deductions: deductions.
	aPayCheck netPay: grossPay - deductions.
	self method pay: aPayCheck