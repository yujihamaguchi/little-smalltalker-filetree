initialization
change: anEmployee

	| classification |
	classification := HourlyClassification
		                  rate: hourlyRate
		                  timeCards: TimeCards new.
	anEmployee classification: classification.
	anEmployee schedule: WeeklySchedule new