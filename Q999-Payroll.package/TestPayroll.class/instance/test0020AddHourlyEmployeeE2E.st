tests
test0020AddHourlyEmployeeE2E

	"
	You should pass this test with TDD.
	refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/eac898f3d1a9c31dbae0953c98f9b79bbbd011d2/Q999-Payroll.package/TestPayroll.class/instance
"

	| empId transaction employee classification schedule method name address hourlyRate |
	"Arrange"
	empId := 123.
	name := 'John'.
	address := 'NewYork'.
	hourlyRate := 10.

	"Act"
	transaction := AddHourlyEmployee
		               empId: empId
		               name: name
		               address: address
		               hourlyRate: hourlyRate.

	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	self deny: employee isNil.
	self assert: employee class equals: Employee.
	self assert: employee name equals: name.
	self assert: employee address equals: address.

	classification := employee classification.
	self deny: classification isNil.
	self assert: classification class equals: HourlyClassification.
	self assert: classification rate equals: hourlyRate.

	schedule := employee schedule.
	self deny: schedule isNil.
	self assert: schedule class equals: WeeklySchedule.

	method := employee method.
	self deny: method isNil.
	self assert: method class equals: HoldMethod