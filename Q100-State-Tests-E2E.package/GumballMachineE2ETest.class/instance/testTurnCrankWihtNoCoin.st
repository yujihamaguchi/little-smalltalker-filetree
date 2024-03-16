tests
testTurnCrankWihtNoCoin

	| printer machine |
	"Arrange"
	printer := Mock new.
	machine := GumballMachine printer: printer.
	"Act"
	machine turnCrank.
	"Assert"
	printer should receive print:
		'Please insert coin before turning the crank.'.
	self assert: machine state class equals: NoCoin