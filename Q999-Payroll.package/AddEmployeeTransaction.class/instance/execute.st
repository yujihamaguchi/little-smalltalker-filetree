execution
execute
	| e |
	e := Employee id: empId name: name address: address.
	e classification: self classification.
	e schedule: self schedule.
	e method: HoldMethod new.
	PayrollDatabase addEmployee: e id: empId