initialization
setId: aNumber name: aNameString address: anAddressString
	id := aNumber.
	name := aNameString.
	address := anAddressString.
	affiliation := NoAffiliation new.
	^ self