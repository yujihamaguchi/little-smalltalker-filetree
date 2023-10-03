execution
execute

	| employee payCheck |
	payChecks ifNil: [ payChecks := Dictionary new ].
	PayrollDatabase allEmployeeIds do: [ :empId | 
		employee := PayrollDatabase employeeWithId: empId.
		payCheck := Paycheck
			            from: (employee payPeriodStartDate: payDate)
			            to: payDate.
		employee payday: payCheck.
		payChecks at: empId put: payCheck ]