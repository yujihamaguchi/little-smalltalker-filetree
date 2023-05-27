as yet unclassified
validatePaycheck: aPaymentTransaction ForEmpId: anEmpIdNumber onPayDate: aPayDate withPayAmount: aPayNumber

	| pc |
	pc := aPaymentTransaction paycheck: anEmpIdNumber.
	self deny: pc isNil.
	self assert: pc payPeriodEndDate equals: aPayDate.
	self assert: pc grossPay equals: aPayNumber.
	self assert: (pc field: 'Disposition') equals: 'Hold'.
	self assert: pc deductions equals: 0.
	self assert: pc netPay equals: aPayNumber