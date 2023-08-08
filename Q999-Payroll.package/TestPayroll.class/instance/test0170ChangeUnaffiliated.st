tests
test0170ChangeUnaffiliated

	| empId cmt e t |
	empId := 1.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.

	t execute.

	cmt := ChangeUnaffiliatedTransaction empId: empId.
	cmt execute.
	e := PayrollDatabase employeeWithId: empId.
	self assert: e affiliation class equals: NoAffiliation