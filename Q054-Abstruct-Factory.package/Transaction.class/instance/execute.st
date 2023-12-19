execution
execute

	| material crusher |
	material := factory createMaterial.
	crusher := factory createCrusher.
	material unwrap.
	material into: crusher.
	crusher turnOn.
	crusher turnOff.
	^ '{1} is {2} and {3} is {4}' format: { 
			  material className.
			  material condition.
			  crusher className.
			  crusher condition }