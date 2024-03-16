tests
testEjectCoinWithNoCoin

	| machine printer |
	"Arrange"
	printer := Mock new.
	machine := GumballMachine printer: printer.
	self assert: machine state class equals: NoCoin.
	"Act"
	machine ejectCoin.
	"Assert"
	printer should receive print: 'There is no coin to eject'.
	self assert: machine state class equals: NoCoin