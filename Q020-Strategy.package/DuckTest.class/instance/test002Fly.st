tests
test002Fly
	| duck flyWithWings flyNoWay rubberDuck |
	flyWithWings := FlyWithWings new.
	duck := Duck flyBehavier: flyWithWings.
	self assert: duck behave equals: 'flying'.

	flyNoWay := FlyNoWay new.
	rubberDuck := RubberDuck flyBehavier: flyNoWay.
	self assert: rubberDuck behave equals: 'no way'