as yet unclassified
payday: aPaycheck
	| grossPay deductions netPay |
	grossPay := classification calculatePay: aPaycheck.
	deductions := affiliation calculateDeductions: aPaycheck.
	netPay := grossPay - deductions.
	aPaycheck grossPay: grossPay.
	aPaycheck deductions: deductions.
	aPaycheck netPay: netPay.
	method pay: aPaycheck.