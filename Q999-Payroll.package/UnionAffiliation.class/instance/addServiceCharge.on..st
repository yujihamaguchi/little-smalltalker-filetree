adding
addServiceCharge: aServiceCharge on: aDateNumber
	serviceCharges ifNil: [ serviceCharges := Dictionary new ].
	serviceCharges at: aDateNumber put: aServiceCharge 
	