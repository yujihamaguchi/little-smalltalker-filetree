tests
testTurnCrankWithCoin
	| machine |
	machine := GumballMachine new initialize.
	self assert: machine count equals: 5.
	self assert: machine state asString equals: 'NoCoin'.

	machine insertCoin.
	self assert: machine state asString equals: 'HasCoin'.

	machine turnCrank.
	self assert: machine count equals: 4.
	self assert: machine state asString equals: 'NoCoin'.
