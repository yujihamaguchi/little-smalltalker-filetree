execution
execute

	| employee schedule classification |
	employee := PayrollDatabase employeeWithId: empId.
	schedule := BiweekSchedule new.
	classification := CommissionedClassification
		                  salary: salary
		                  commissionRate: commissionRate.
	employee
		schedule: schedule;
		classification: classification