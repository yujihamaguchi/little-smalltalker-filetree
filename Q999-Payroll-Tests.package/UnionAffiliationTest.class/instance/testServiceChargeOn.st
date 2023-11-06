tests
testServiceChargeOn

	| affiliation date serviceCharges |
	"Arrange"
	date := Mock new.
	serviceCharges := Mock new.
	affiliation := UnionAffiliation
		               memberId: Mock new
		               dues: Mock new
		               serviceCharges: serviceCharges.
	"Act"
	affiliation serviceChargeOn: date.

	"Assert"
	serviceCharges should receive at: date