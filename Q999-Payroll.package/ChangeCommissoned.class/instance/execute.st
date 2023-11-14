execution
execute

	| employee commissionedClassification |
	employee := PayrollDatabase employeeWithId: empId.
	employee ifNil: [ 
		Exception signal: 'No such employee. id: ' , empId asString ].
	commissionedClassification := CommissionedClassification
		                              salary: salary
		                              commissionRate: commissionRate
		                              salesReceipts: SalesReceipts new.
	employee classification: commissionedClassification.
	employee schedule: BiweekSchedule new