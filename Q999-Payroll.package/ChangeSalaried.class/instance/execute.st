execution
execute

	| employee classification |
	employee := PayrollDatabase employeeWithId: empId.
	classification := SalariedClassification salary: salary.
	employee classification: classification 