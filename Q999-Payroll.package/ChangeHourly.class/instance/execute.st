execution
execute

	| employee hourlyClassification weeklyShedule |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ 
		Error signal: 'No such employee. id: ' , empId asString ].
	hourlyClassification := HourlyClassification hourlyRate: hourlyRate.
	weeklyShedule := WeeklyShedule new.
	employee
		classification: hourlyClassification;
		schedule: weeklyShedule