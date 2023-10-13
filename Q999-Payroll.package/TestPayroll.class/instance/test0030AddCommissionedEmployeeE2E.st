tests
test0030AddCommissionedEmployeeE2E

	| empId transaction employee classification schedule method name address salary commissionRate |
	"Arrange"
	empId := 123.
	name := 'Mike'.
	address := 'Chicago'.
	salary := 2340.
	commissionRate := 20.

	"Act"
	transaction := AddCommissionedEmployee
		               empId: empId
		               name: name
		               address: address
		               salary: salary
		               commissionRate: commissionRate.

	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	self deny: employee isNil.
	self assert: employee class equals: Employee.
	self assert: employee name equals: name.

	classification := employee classification.
	self deny: classification isNil.
	self assert: classification class equals: CommissionedClassification.
	self assert: classification salary equals: salary.
	self assert: classification commissionRate equals: commissionRate.

	schedule := employee schedule.
	self deny: schedule isNil.
	self assert: schedule class equals: BiweekSchedule.

	method := employee method.
	self deny: method isNil.
	self assert: method class equals: HoldMethod