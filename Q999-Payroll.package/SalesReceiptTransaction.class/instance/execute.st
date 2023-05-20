execution
execute

	| e cc sr |
	e := PayrollDatabase employee: empId.
	e ifNil: [ Error signal: 'No such employee' ] ifNotNil: [
		cc := e classification.
		cc class = CommissionedClassification
			ifTrue: [
				sr := SalesReceipt date: date amount: amount.
				cc addSalesReceipt: sr ]
			ifFalse: [ Error signal: 'must be CommissionedClassification' ] ]