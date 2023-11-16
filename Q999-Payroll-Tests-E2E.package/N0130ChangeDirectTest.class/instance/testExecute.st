tests
testExecute

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/0a13bd5d314a351b8072e8edb34db6e0dc6054f8/Q999-Payroll.package/TestPayroll.class/instance
"

	| empId transaction employee |
	"Arrange"
	empId := 123.
	
	transaction := AddSalariedEmployee
		               empId: empId
		               name: Mock new
		               address: Mock new
		               salary: Mock new.
	transaction execute.
	employee := PayrollDatabase employeeWithId: empId.
	self assert: employee method class equals: HoldMethod.

	"Act"
	transaction := ChangeDirect empId: empId.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	self assert: employee method class equals: DirectMethod
