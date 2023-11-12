execution
execute

	| employee classification |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ 
		Exception signal: 'No such employee. id: ' , empId asString ].
	classification := HourlyClassification
		                  rate: hourlyRate
		                  timeCards: TimeCards new.
	employee classification: classification.
	employee schedule: WeeklySchedule new