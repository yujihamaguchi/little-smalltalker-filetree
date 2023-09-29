execution
execute

	| employee hourlyClassification weeklyShedule |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ 
		Error signal: 'No such employee. id: ' , empId asString ].
	hourlyClassification := HourlyClassification hourlyRate: hourlyRate.
	weeklyShedule := WeeklySchedule new.
	employee
		classification: hourlyClassification;
		schedule: weeklyShedule