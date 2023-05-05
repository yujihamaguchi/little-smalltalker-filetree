tests
testInsertCoin

	| machine |
	machine := GumballMachine new initialize.
	self assert: machine count equals: 5.
	self assert: machine state asString equals: 'NoCoin'.

	machine insertCoin.
	self assert: machine state asString equals: 'HasCoin'.

	self should: [ machine insertCoin ] raise: CoinAlreadyInsertedException 
