tests
testChangeMailTransaction

	| empId cdt e t |
	empId := 1.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.
	t execute.

	cdt := ChangeMailTransaction empId: empId.
	cdt execute.

	e := PayrollDatabase employee: empId.
	self assert: e method class equals: MailMethod