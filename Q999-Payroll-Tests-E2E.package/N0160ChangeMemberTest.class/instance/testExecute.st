tests
testExecute

	"
	[ UseCase6: Change employee's profile ]
	- ChgEmp <EmpID> Member <memberID> Dues <rate>

	Attachment 1: In the case where the selected empID / memberID is a non-existent one.
	  Output an error message only, and perform no further processing.
	"

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/7bd3fb03f1083bb4e71c666965544a2f5a20d79b/Q999-Payroll-Tests.package
"

	| empId employee affiliation dues memberId member transaction |
	"Arrange"
	empId := 123.
	memberId := 456.
	dues := 789.
	transaction := AddSalariedEmployee
		               empId: empId
		               name: 'Bob'
		               address: 'NY'
		               salary: 100.
	transaction execute.

	"Act"
	transaction := ChangeMember
		               empId: empId
		               memberId: memberId
		               dues: dues.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	affiliation := employee affiliation.
	self assert: affiliation class equals: UnionAffiliation.
	self assert: affiliation dues equals: dues.

	member := PayrollDatabase employeeWithUnionMemberId: memberId.
	self assert: employee equals: member