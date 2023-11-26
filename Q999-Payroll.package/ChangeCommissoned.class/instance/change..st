initialization
change: anEmployee

	| commissionedClassification |
	commissionedClassification := CommissionedClassification
		                              salary: salary
		                              commissionRate: commissionRate
		                              salesReceipts: SalesReceipts new.
	anEmployee classification: commissionedClassification.
	anEmployee schedule: BiweekSchedule new