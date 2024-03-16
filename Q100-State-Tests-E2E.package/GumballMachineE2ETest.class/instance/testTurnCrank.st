tests
testTurnCrank

	| machine message printer |
	"Arrange"
	printer := Mock new.
	machine := GumballMachine printer: printer.
	machine insertCoin.
	"Act"
	message := machine turnCrank.
	"Assert"
	printer should receive print: 'A gumball come out!' , String cr.
	self assert: machine state class equals: NoCoin