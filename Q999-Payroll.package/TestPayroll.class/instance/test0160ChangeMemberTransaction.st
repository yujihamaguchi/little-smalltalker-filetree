tests
test0160ChangeMemberTransaction

	| inputEmpId inputMemberId inputDues employee transaction unionAffiliation |
	"Arrange"
	inputEmpId := Mock new.
	inputMemberId := Mock new.
	inputDues := Mock new.

	employee := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn:
		employee.
	unionAffiliation := Mock new.
	(UnionAffiliation stub memberId: inputMemberId dues: inputDues) 
		willReturn: unionAffiliation.

	"Act"
	transaction := ChangeMember
		               empId: inputEmpId
		               memberId: inputMemberId
		               dues: inputDues.
	transaction execute.

	"Assert"
	PayrollDatabase should receive employeeWithId: inputEmpId.
	UnionAffiliation should receive
		memberId: inputMemberId
		dues: inputDues.
	employee should receive affiliation: unionAffiliation.
	PayrollDatabase should receive
		addUnionMember: employee
		withId: inputMemberId