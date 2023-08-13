tests
test0072AddServiceChargeE2E
	| empId inputMemberId employee affiliation inputDate serviceCharge inputAmount transaction |
	"Arrange"
	inputMemberId := 10.
	inputDate := 20230801.
	inputAmount := 13.

	empId := 2.
	transaction := AddHourlyEmployee
		               empId: empId
		               name: 'Bill'
		               address: 'Home'
		               hourlyRate: 15.
	transaction execute.
	employee := PayrollDatabase employeeWithId: empId.

	affiliation := UnionAffiliation memberId: inputMemberId dues: 12.
	employee affiliation: affiliation.
	PayrollDatabase addUnionMember: employee withId: inputMemberId.

	"Action"
	transaction := AddServiceCharge
		               memberId: inputMemberId
		               date: inputDate
		               amount: inputAmount.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	affiliation := employee affiliation.
	serviceCharge := affiliation serviceChargeOn: inputDate.
	self deny: serviceCharge isNil.
	self assert: serviceCharge amount equals: inputAmount