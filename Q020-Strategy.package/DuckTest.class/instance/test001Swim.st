tests
test001Swim
	| duck mallardDuck rubberDuck |
	duck := Duck new.
	self assert: duck swim equals: 'swimming'.

	mallardDuck := MallardDuck new.
	self assert: mallardDuck swim equals: 'swimming'.

	rubberDuck := RubberDuck new.
	self assert: rubberDuck swim equals: 'floating'