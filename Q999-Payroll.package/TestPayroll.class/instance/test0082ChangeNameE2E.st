tests
test0082ChangeNameE2E

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/7de7de292bf02e838e78c4723b571b6aa0eea42c/Q999-Payroll.package/TestPayroll.class/instance
"

	| inputEmpId employee transaction inputName |
	"Arrange"
	inputEmpId := 1.
	inputName := 'Bob'.

	transaction := AddHourlyEmployee
		               empId: inputEmpId
		               name: 'Bill'
		               address: 'Home'
		               hourlyRate: 10.

	transaction execute.

	"Action"
	transaction := ChangeName empId: inputEmpId name: inputName.
	transaction execute.

	employee := PayrollDatabase employeeWithId: inputEmpId.

	"Assert"
	self deny: employee isNil.
	self assert: employee name equals: inputName