tests
test0102ChangeHourlyE2E

	| inputEmpId employee classification inputHourlyRate transaction |
	"Arrange"
	inputEmpId := Mock new.
	inputHourlyRate := Mock new.
	transaction := AddSalariedEmployee
		               empId: inputEmpId
		               name: ''
		               address: ''
		               salary: 0.
	transaction execute.

	"Action"
	transaction := ChangeHourly
		               empId: inputEmpId
		               hourlyRate: inputHourlyRate.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: inputEmpId.
	classification := employee classification.
	self assert: classification class equals: HourlyClassification.
	self assert: classification hourlyRate equals: inputHourlyRate



















	"	| empId t chct e |
	empId := 1.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.

	t execute.

	chct := ChangeHourly
		        empId: empId
		        hourlyRate: 10.
	chct execute.

	e := PayrollDatabase employeeWithId: empId.
	self deny: e isNil.
	self assert: e classification class equals: HourlyClassification.
	self assert: e schedule class equals: WeeklyShedule.	
	self assert: e classification hourlyRate equals: 10"