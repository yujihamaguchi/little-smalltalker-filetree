execution
execute

	| employee classification |
	employee := Employee id: empId name: name address: address.
	classification := HourlyClassification rate: hourlyRate.
	employee classification: classification.
	employee schedule: WeeklySchedule new.
	employee method: HoldMethod new.
	PayrollDatabase addEmployee: employee