tests
testPayday

	| payCheck affiliation target deductions classification grossPay netPay method |
	"Arrange"
	target := Employee new.
	payCheck := Mock new.

	classification := Mock new.
	target stub classification willReturn: classification.
	grossPay := 5.
	(classification stub calculatePay: payCheck) willReturn: grossPay.

	affiliation := Mock new.
	target stub affiliation willReturn: affiliation.
	deductions := 3.
	(affiliation stub calculateDeductions: payCheck) willReturn:
		deductions.

	netPay := grossPay - deductions.

	method := Mock new.
	target stub method willReturn: method.

	"Act"
	target payday: payCheck.

	"Assert"
	classification should receive calculatePay: payCheck.
	affiliation should receive calculateDeductions: payCheck.
	payCheck should receive grossPay: grossPay.
	payCheck should receive deductions: deductions.
	payCheck should receive netPay: netPay.
	method should receive pay: payCheck
