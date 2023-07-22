tests
test0010AddSalariedEmployee

	"
	1. Before proceeding to the implementation phase, ensure that you have thoroughly read Chapter 18.    
	   Practice reading each use case( 1 - 9 ), extracting design information from it on your own, and then        comparing it with Uncle Bob's ideas.
	2. Don't push until all implementaions are completed.
	3. After implementation, please read Chapter 22 and organize the group of classes using package ( on Smalltalk, using tag maybe).
	"

	| empId t e sc ms hm |
	empId := 1.
	t := AddSalariedEmployee
		     empId: empId
		     name: 'Bob'
		     address: 'Home'
		     salary: 1000.

	t execute.

	e := PayrollDatabase employee: empId.
	self deny: e isNil.
	self assert: e class equals: Employee.
	self assert: e name equals: 'Bob'.

	sc := e classification.
	self deny: sc isNil.
	self assert: sc class equals: SalariedClassification.
	self assert: sc salary equals: 1000.

	ms := e schedule.
	self deny: ms isNil.
	self assert: ms class equals: MonthlySchedule.

	hm := e method.
	self deny: hm isNil.
	self assert: hm class equals: HoldMethod