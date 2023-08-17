execution
execute

	| employee hourlyClassification weeklyShedule |
	employee := PayrollDatabase employeeWithId: empId.
	hourlyClassification := HourlyClassification hourlyRate: hourlyRate.
	weeklyShedule := WeeklyShedule new.
	employee
		classification: hourlyClassification;
		schedule: weeklyShedule