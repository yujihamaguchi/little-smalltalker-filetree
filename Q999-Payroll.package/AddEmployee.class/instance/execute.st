execution
execute

	| employee |
	employee := Employee empId: empId name: name address: address.
	employee classification: self classification.
	employee schedule: self schedule.
	employee method: HoldMethod new.
	PayrollDatabase save: employee