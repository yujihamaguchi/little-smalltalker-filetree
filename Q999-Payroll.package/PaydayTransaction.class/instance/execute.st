execution
execute

	| empIds employee pc |
	empIds := PayrollDatabase allEmployeeIds.
	empIds do: [ :empId |
		employee := PayrollDatabase employee: empId.
		(employee schedule isPayDate: payDate) ifTrue: [
			pc := PayCheck
				      from: (employee payPriodStartDate: payDate)
				      to: payDate.
			paychecks := paychecks ifNil: [ paychecks := Dictionary new ].
			paychecks at: empId put: pc.
			employee payday: pc ] ]