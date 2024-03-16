tests
testEjectCoin

	| machine |
	"Arrange"
	machine := GumballMachine new.
	machine insertCoin.
	self assert: machine state class equals: HasCoin.
	"Act"
	machine ejectCoin.
	"Assert"
	self assert: machine state class equals: NoCoin