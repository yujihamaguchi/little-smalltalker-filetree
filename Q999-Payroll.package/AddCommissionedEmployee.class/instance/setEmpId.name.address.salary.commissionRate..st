initialization
setEmpId: anEmpIdNumber name: aNameString address: anAddressString salary: aSalaryNumber commissionRate: aCommissionRateNumber

	self
		setEmpId: anEmpIdNumber
		name: aNameString
		address: anAddressString.
	salary := aSalaryNumber.
	commissionRate := aCommissionRateNumber.
	^ self