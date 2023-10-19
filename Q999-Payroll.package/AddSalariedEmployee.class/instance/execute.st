execution
execute

	| employee classification |
	employee := Employee id: empId name: name address: address.
	classification := SalariedClassification salary: salary.
	employee classification: classification.
	employee schedule: MonthlySchedule new.
	employee method: HoldMethod new.
   PayrollDatabase addEmployee: employee 