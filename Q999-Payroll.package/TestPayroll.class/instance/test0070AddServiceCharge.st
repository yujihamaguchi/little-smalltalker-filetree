tests
test0070AddServiceCharge

	"
	[ UseCase4: Request for service charge processing ]
	- ServiceCharge <memberID> <amount>

	Attachment 1: In the case where the selected memberID is a non-existent union member.
	  Output an error message only, and perform no further processing.
	"

	| empId t memberId sct employee affiliation date serviceCharge |
	empId := 2.
	memberId := 10.

	t := AddHourlyEmployee
		     empId: empId
		     name: 'Bill'
		     address: 'Home'
		     hourlyRate: 15.

	t execute.

	employee := PayrollDatabase employeeWithId: empId.
 
	affiliation := UnionAffiliation memberId: memberId dues: 12.
	employee affiliation: affiliation.
	PayrollDatabase addUnionMember: employee withId: memberId.
	
	date := 20230801.

	sct := AddServiceCharge memberId: memberId date: date amount: 13.
	sct execute.

	serviceCharge := affiliation serviceChargeOn: date.
	self deny: serviceCharge isNil.	
	self assert: serviceCharge amount equals: 13