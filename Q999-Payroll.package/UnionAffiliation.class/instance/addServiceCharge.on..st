adding
addServiceCharge: aServiceCharge on: aDateNumber
	serviceCharges ifNil: [ serviceCharges := ServiceCharges new ].
	serviceCharges at: aDateNumber put: aServiceCharge 
	