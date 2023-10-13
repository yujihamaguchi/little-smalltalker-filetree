execution
execute

	| employee classification |
	employee := Employee id: empId name: name address: address.
	classification := CommissionedClassification
		                  salary: salary
		                  commissionRate: commissionRate.
	employee classification: classification.
	employee schedule: BiweekSchedule new.
	employee method: HoldMethod new.
	PayrollDatabase employee: employee