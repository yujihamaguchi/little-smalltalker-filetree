tests
testTurnCrankWhenSoldOut

	| printer machine |
	"Arrange"
	printer := Mock new.
	machine := GumballMachine printer: printer.
	machine state: SoldOut new.
	"Act"
	machine turnCrank.
	"Assert"
	printer should receive print: 'It is sold out, sorry.'.
	self assert: machine state class equals: SoldOut