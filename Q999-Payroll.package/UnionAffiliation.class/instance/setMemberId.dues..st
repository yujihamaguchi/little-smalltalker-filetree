initialization
setMemberId: aMemberIdNumber dues: aDuesNumber
	memberId := aMemberIdNumber.
	dues := aDuesNumber.
	serviceCharges := Dictionary new.
	^ self