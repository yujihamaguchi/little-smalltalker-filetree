tests
test0070AddServiceCharge

	"
	[ UseCase4: Request for service charge processing ]
	- ServiceCharge <memberID> <amount>

	Attachment 1: In the case where the selected memberID is a non-existent union member.
	  Output an error message only, and perform no further processing.
	"


	| empId t tct e af memberId sct timeCardDate serviceChargeDate employee affiliation date |
	empId := 2.
	memberId := 10.

	t := AddHourlyEmployee
		     empId: empId
		     name: 'Bill'
		     address: 'Home'
		     hourlyRate: 15.

	t execute.
"
	timeCardDate := MyDate fromString: '05/18/2023'.
	tct := AddTimeCard date: timeCardDate hours: 8 empId: empId.
	tct execute.

	e := PayrollDatabase employee: empId.

	af := UnionAffiliation memberId: memberId dues: 12.
	e affiliation: af.
	PayrollDatabase addUnionMember: e id: memberId.
	"
	employee := PayrollDatabase employee: empId.
	affiliation := UnionAffiliation memberId: memberId dues: 12.
	employee affiliation: affiliation.
	PayrollDatabase stub addUnionMember: employee willReturn: memberId.
	date := 20230801.
	
	sct := AddServiceCharge
		       memberId: memberId
		       date: date
		       amount: 13.
	sct execute.
	
	self assert: (affiliation serviceCharge: date) amount equals: 13