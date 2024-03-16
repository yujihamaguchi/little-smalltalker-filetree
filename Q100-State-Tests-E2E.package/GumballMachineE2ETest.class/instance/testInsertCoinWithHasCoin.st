tests
testInsertCoinWithHasCoin

	| printer machine |
	"Arrange"
	printer := Mock new.
	machine := GumballMachine printer: printer.
	machine insertCoin.
	self assert: machine state class equals: HasCoin.
	"Act"
	machine insertCoin.
	"Assert"
	printer should receive print: 'A coin is already inserted.'.
	self assert: machine state class equals: HasCoin