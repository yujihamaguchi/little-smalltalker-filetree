tests
testCreateSauce
	| ingredientFactory |
	ingredientFactory := NYIngredientFactory new.
	self assert: ingredientFactory createSauce class equals: ChiliSauce