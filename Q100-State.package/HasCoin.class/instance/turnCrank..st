as yet unclassified
turnCrank: aGumballMachine
	aGumballMachine decrease.
	aGumballMachine count = 0 ifTrue: [ aGumballMachine state: SoldOut new ] ifFalse: [ aGumballMachine state: NoCoin new ]