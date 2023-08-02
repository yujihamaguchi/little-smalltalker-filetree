tests
test0070AddServiceCharge

	"
	[ UseCase4: Request for service charge processing ]
	- ServiceCharge <memberID> <amount>

	Attachment 1: In the case where the selected memberID is a non-existent union member.
	  Output an error message only, and perform no further processing.
	"


	| empId t tct e af memberId sct timeCardDate serviceChargeDate |
	empId := 2.
	memberId := 10.

	t := AddHourlyEmployee
		     empId: empId
		     name: 'Bill'
		     address: 'Home'
		     hourlyRate: 15.

	t execute.

	timeCardDate := MyDate fromString: '05/18/2023'.
	tct := AddTimeCard date: timeCardDate hours: 8 empId: empId.
	tct execute.

	e := PayrollDatabase employee: empId.

	af := UnionAffiliation memberId: memberId dues: 12.
	e affiliation: af.
	PayrollDatabase addUnionMember: e id: memberId.
	
	serviceChargeDate := MyDate fromString: '06/01/2023'.
	sct := AddServiceCharge
		       date: serviceChargeDate
		       amount: 13
		       memberId: memberId.
	sct execute.
	self assert: (af serviceCharge: serviceChargeDate) amount  equals: 13