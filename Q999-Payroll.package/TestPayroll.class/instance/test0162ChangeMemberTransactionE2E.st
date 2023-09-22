tests
test0162ChangeMemberTransactionE2E

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/0a13bd5d314a351b8072e8edb34db6e0dc6054f8/Q999-Payroll.package/TestPayroll.class/instance
"
	| inputEmpId employee affiliation inputDues inputMemberId member transaction |
	"Arrange"
	inputEmpId := 123.
	inputMemberId := 456.
	inputDues := 789.
	transaction := AddSalariedEmployee
		               empId: inputEmpId
		               name: 'Bob'
		               address: 'NY'
		               salary: 100.
	transaction execute.

	"Act"
	transaction := ChangeMember
		               empId: inputEmpId
		               memberId: inputMemberId
		               dues: inputDues.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: inputEmpId.
	affiliation := employee affiliation.
	self assert: affiliation class equals: UnionAffiliation.
	self assert: affiliation dues equals: inputDues.

	member := PayrollDatabase employeeWithUnionMemberId: inputMemberId.
	self assert: employee equals: member