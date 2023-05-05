tests
testEjectCoin
	| machine |
	machine := GumballMachine new initialize.
	self assert: machine count equals: 5.
	self assert: machine state asString equals: 'NoCoin'.

	machine insertCoin.
	machine ejectCoin.
	self assert: machine state asString equals: 'NoCoin'.
	
	self should: [ machine ejectCoin ] raise: NoCoinToEjectException 
