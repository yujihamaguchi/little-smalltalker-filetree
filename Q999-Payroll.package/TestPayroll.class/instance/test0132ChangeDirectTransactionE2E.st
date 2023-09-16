tests
test0132ChangeDirectTransactionE2E

	| inputEmpId transaction employee |
	"Arrange"
	inputEmpId := 123.
	transaction := AddSalariedEmployee
		               empId: inputEmpId
		               name: Mock new
		               address: Mock new
		               salary: Mock new.
	transaction execute.
	employee := PayrollDatabase employeeWithId: inputEmpId.
	self assert: employee method class equals: HoldMethod.

	"Act"
	transaction := ChangeDirect empId: inputEmpId.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: inputEmpId.
	self assert: employee method class equals: DirectMethod
	"	| empId cdt e t |
	empId := 1.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.
	t execute.

	cdt := ChangeDirect empId: empId.
	cdt execute.

	e := PayrollDatabase employeeWithId: empId.
	self assert: e method class equals: DirectMethod"