tests
test0092ChangeAddressE2E

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/7de7de292bf02e838e78c4723b571b6aa0eea42c/Q999-Payroll.package/TestPayroll.class/instance
"

	| inputEmpId transaction employee inputAddress |
	"Arrange"
	inputEmpId := Mock new.
	inputAddress := Mock new.
	transaction := AddSalariedEmployee
		               empId: inputEmpId
		               name: 'Bob'
		               address: Mock new
		               salary: 10.
	transaction execute.

	"Action"
	transaction := ChangeAddress empId: inputEmpId address: inputAddress.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: inputEmpId.
	self deny: employee isNil.
	self assert: employee address equals: inputAddress