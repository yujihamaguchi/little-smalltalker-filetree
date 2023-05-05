tests
testSoldOut

	| machine |
	machine := GumballMachine new initialize.
	self assert: machine count equals: 5.
	self assert: machine state asString equals: 'NoCoin'.

	machine insertCoin.
	machine turnCrank.
	machine insertCoin.
	machine turnCrank.
	machine insertCoin.
	machine turnCrank.
	machine insertCoin.
	machine turnCrank.
	machine insertCoin.
	machine turnCrank.

	self assert: machine count equals: 0.
	self assert: machine state asString equals: 'SoldOut'