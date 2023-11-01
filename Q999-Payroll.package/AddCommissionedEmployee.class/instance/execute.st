execution
execute

	| employee classification |
	employee := Employee id: empId name: name address: address.
	classification := CommissionedClassification
		                  salary: salary
		                  commissionRate: commissionRate salesReceipts: SalesReceipts new.
	employee classification: classification.
	employee schedule: BiweekSchedule new.
	employee method: HoldMethod new.
	PayrollDatabase addEmployee: employee