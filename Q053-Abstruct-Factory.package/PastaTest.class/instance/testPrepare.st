tests
testPrepare

	| ingredientFactory target aSauce aNoodle aName |
	ingredientFactory := Mock new.
	aSauce := Mock new.
	aNoodle := Mock new.
	aName := Mock new.

	ingredientFactory stub createSauce willReturn: aSauce.
	ingredientFactory stub createNoodle willReturn: aNoodle.

	target := Pasta ingredientFactory: ingredientFactory name: aName.
	self assert: target name equals: aName.

	target prepare.

	self assert: target sauce equals: aSauce.
	self assert: target noodle equals: aNoodle.

	ingredientFactory should receive createSauce once.
	ingredientFactory should receive createNoodle once