adding
add: aServiceCharge

	serviceCharges ifNil: [ serviceCharges := Dictionary new ].
	serviceCharges at: aServiceCharge date put: aServiceCharge 
	