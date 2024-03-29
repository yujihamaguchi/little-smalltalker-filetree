tests
test0031AddCommissionedEmployee

	| empId name address salary commissionRate transaction employee classification schedule method salesReceipts |
	"Arrange"
	empId := Mock new.
	name := Mock new.
	address := Mock new.
	salary := Mock new.
	commissionRate := Mock new.

	employee := Mock new.
	(Employee stub id: empId name: name address: address) willReturn:
		employee.

	salesReceipts := Mock new.
	SalesReceipts stub new willReturn: salesReceipts.
	classification := Mock new.
	(CommissionedClassification stub
		 salary: salary
		 commissionRate: commissionRate
		 salesReceipts: salesReceipts) willReturn: classification.

	schedule := Mock new.
	BiweekSchedule stub new willReturn: schedule.

	method := Mock new.
	HoldMethod stub new willReturn: method.

	(PayrollDatabase stub addEmployee: employee) willReturnYourself.

	"Act"
	transaction := AddCommissionedEmployee
		               empId: empId
		               name: name
		               address: address
		               salary: salary
		               commissionRate: commissionRate.

	transaction execute.

	"Assert"
	Employee should receive id: empId name: name address: address.
	CommissionedClassification should receive
		salary: salary
		commissionRate: commissionRate
		salesReceipts: salesReceipts.
	employee should receive classification: classification.
	BiweekSchedule should receive new.
	employee should receive schedule: schedule.
	HoldMethod should receive new.
	employee should receive method: method.
	PayrollDatabase should receive addEmployee: employee