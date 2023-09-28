as yet unclassified
payday: aPayCheck

	| grossPay deductions |
	grossPay := classification calculatePay: aPayCheck.
	deductions := affiliation calculateDeductions: aPayCheck.
	aPayCheck grossPay: grossPay.
	aPayCheck deductions: deductions.
	aPayCheck netPay: grossPay - deductions.
	method pay: aPayCheck