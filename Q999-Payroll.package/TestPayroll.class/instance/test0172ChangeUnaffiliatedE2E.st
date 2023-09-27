tests
test0172ChangeUnaffiliatedE2E

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/4f927f75c8c763338f3aad5affbeeeca0291e0d1/Q999-Payroll.package/TestPayroll.class/instance
"

	| employee inputEmpId transaction |
	"Arrange"
	inputEmpId := 123.
	transaction := AddSalariedEmployee
		               empId: inputEmpId
		               name: Mock new
		               address: Mock new
		               salary: Mock new.
	transaction execute.
	employee := PayrollDatabase employeeWithId: inputEmpId.
	self assert: employee affiliation isNil.

	"Act"
	transaction := ChangeUnaffiliated empId: inputEmpId.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: inputEmpId.
	self assert: employee affiliation class equals: NoAffiliation