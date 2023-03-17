tests
testCreateNoodle
	| ingredientFactory |
	ingredientFactory := NYIngredientFactory new.
	self assert: ingredientFactory createNoodle class equals: ThinNoodle