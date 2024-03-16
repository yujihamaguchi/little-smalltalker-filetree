as yet unclassified
turnCrank: aGumballMachine

	aGumballMachine printer print: 'A gumball come out!' , String cr.
	aGumballMachine decrease.
	aGumballMachine count = 0
		ifTrue: [ aGumballMachine state: SoldOut new ]
		ifFalse: [ aGumballMachine state: NoCoin new ]