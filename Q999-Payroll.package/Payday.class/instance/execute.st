execution
execute

	| employee payCheck |
	paychecks ifNil: [ paychecks := Dictionary new ].
	PayrollDatabase allEmployeeIds do: [ :empId | 
		employee := PayrollDatabase employeeWithId: empId.
		payCheck := Paycheck
			            from: (employee payPeriodStartDate: payDate)
			            to: payDate.
		employee payday: payCheck.
		paychecks at: empId put: payCheck ]