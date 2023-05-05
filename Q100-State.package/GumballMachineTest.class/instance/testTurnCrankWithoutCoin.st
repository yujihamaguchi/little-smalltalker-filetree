tests
testTurnCrankWithoutCoin
	| machine |
	machine := GumballMachine new initialize.
	self assert: machine count equals: 5.
	self assert: machine state asString equals: 'NoCoin'.

	machine turnCrank.
	self assert: machine count equals: 5.
	self assert: machine state asString equals: 'NoCoin'.
