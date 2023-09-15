execution
execute

	| employee schedule classification |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ Exception signal: 'No such employee. id: ' , empId asString ].
	schedule := BiweekSchedule new.
	classification := CommissionedClassification
		                  salary: salary
		                  commissionRate: commissionRate.
	employee
		schedule: schedule;
		classification: classification