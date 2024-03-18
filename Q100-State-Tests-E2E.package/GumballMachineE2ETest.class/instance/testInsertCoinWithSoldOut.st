tests
testInsertCoinWithSoldOut

	| printer machine |
	"Arrange"
	printer := Mock new.
	machine := GumballMachine printer: printer.
	machine stub state willReturn: SoldOut new.
	self assert: machine state class equals: SoldOut.
	"Act"
	machine insertCoin.
	"Assert"
	printer should receive print:
		'Coins cannot be inserted due to being sold out'.
	self assert: machine state class equals: SoldOut