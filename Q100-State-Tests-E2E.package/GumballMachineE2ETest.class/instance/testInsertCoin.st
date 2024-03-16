tests
testInsertCoin

	| machine |
	"Arrange"
	machine := GumballMachine new.
	"Act"
	machine insertCoin.
	"Assert"
	self assert: machine state class equals: HasCoin