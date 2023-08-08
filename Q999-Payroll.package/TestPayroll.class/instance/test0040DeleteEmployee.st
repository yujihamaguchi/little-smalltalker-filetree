tests
test0040DeleteEmployee

	"
	[ UseCase2: Delete employee ]
	
	- DelEmp <EmpID>
	"

	| empId t e dt |
	empId := 3.
	t := AddCommissionedEmployee
		     empId: empId
		     name: 'Lance'
		     address: 'Home'
		     salary: 2500
		     commissionRate: 30.

	t execute.

	e := PayrollDatabase employeeWithId: empId.
	self deny: e isNil.

	dt := DeleteEmployee empId: empId.

	dt execute.

	e := PayrollDatabase employeeWithId: empId.
	self assert: e isNil