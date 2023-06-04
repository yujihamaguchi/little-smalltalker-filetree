tests
testPaySingleSalariedEmployee

	| empId t payDate pt |
	empId := 1.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.
	t execute.
	payDate := MyDate fromString: '11/30/2023'.
	pt := PaydayTransaction payDate: payDate.
	pt execute.
	self
		validatePaycheck: pt
		ForEmpId: empId
		onPayDate: payDate
		withPayAmount: 1000