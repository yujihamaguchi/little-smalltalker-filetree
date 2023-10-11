tests
test0010AddSalariedEmployeeE2E

	" [ Overall Rule ]
	1. Before proceeding to the implementation phase, ensure that you have thoroughly read Chapter 18.    
	   Practice reading each use case( 1 - 9 ), extracting design information from it on your own, and then        comparing it with Uncle Bob's ideas.
	2. After implementation, please read Chapter 22 and organize the group of classes using package ( on Smalltalk, using tag maybe).
	"

	"
	[ UseCase1: Add employee ]
	Three are three transaciton type below.
	
	- AddEmp <EmpID> '<name>' '<address>' H <hourly-rate>
	- AddEmp <EmpID> '<name>' '<address>' S <monthly-salary>
	- AddEmp <EmpID> '<name>' '<address>' C <monthly-salary> <commission-rate>
	
	The default method for salary payment is the HoldMethod.
	If an employee wishes for a different method, they will need to submit a separate change request.
	"

	| empId transaction employee classification schedule method name address salary |
	"Arrange"
	empId := 123.
	name := 'Bob'.
	address := 'Home'.
	salary := 2340.
	
	"Act"
	transaction := AddSalariedEmployee
		               empId: empId
		               name: name
		               address: address
		               salary: salary.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	self deny: employee isNil.
	self assert: employee class equals: Employee.
	self assert: employee name equals: name.
	self assert: employee address equals: address.

	classification := employee classification.
	self deny: classification isNil.
	self assert: classification class equals: SalariedClassification.
	self assert: classification salary equals: salary.

	schedule := employee schedule.
	self deny: schedule isNil.
	self assert: schedule class equals: MonthlySchedule.

	method := employee method.
	self deny: method isNil.
	self assert: method class equals: HoldMethod