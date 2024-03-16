tests
testInsertCoin

	| machine |
	"Arrange"
	machine := GumballMachine new.
	self assert: machine state class equals: NoCoin.
	"Act"
	machine insertCoin.
	"Assert"
	self assert: machine state class equals: HasCoin