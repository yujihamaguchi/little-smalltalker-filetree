tests
testExecute
	"
	[ UseCase6: Change employee's profile ]
	- ChgEmp <EmpID> NoMember

	Attachment 1: In the case where the selected empID / memberID is a non-existent one.
	  Output an error message only, and perform no further processing.
	"

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/5c03cd5a6a1d9c604f8d3e660a78300a3868ce6f/Q999-Payroll-Tests.package
"

	| employee empId transaction memberId dues member |
	"Arrange"
	empId := 123.
	memberId := 234.
	dues := 45.
	
	transaction := AddSalariedEmployee
		               empId: empId
		               name: Mock new
		               address: Mock new
		               salary: Mock new.
	transaction execute.

	transaction := ChangeMember
		               empId: empId
		               memberId: memberId
		               dues: dues.
	transaction execute.

	"Act"
	transaction := ChangeUnaffiliated empId: empId.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	self assert: employee affiliation class equals: NoAffiliation.

	member := PayrollDatabase employeeWithUnionMemberId: memberId.
	self assert: member isNil