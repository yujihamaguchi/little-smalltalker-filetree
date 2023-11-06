tests
testAddServiceCharge

	| affiliation serviceCharge serviceCharges memberId dues |
	memberId := Mock new.
	dues := Mock new.
	serviceCharges := Mock new.
	affiliation := Mock new.
	serviceCharge := Mock new.

	affiliation := UnionAffiliation
		               memberId: memberId
		               dues: dues
		               serviceCharges: serviceCharges.

	"Act"
	affiliation addServiceCharge: serviceCharge.

	"Assert"
	serviceCharges should receive add: serviceCharge