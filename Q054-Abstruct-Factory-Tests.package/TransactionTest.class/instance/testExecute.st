tests
testExecute

	| material crusher transaction factory |
	"Arrange"
	factory := Mock new.

	material := Mock new.
	factory stub createMaterial willReturn: material.
	crusher := Mock new.
	factory stub createCrusher willReturn: crusher.

	material stub unwrap willReturnYourself.
	(material stub into: crusher) willReturnYourself.
	crusher stub turnOn willReturnYourself.
	crusher stub turnOff willReturnYourself.

	"Act"
	transaction := Transaction factory: factory.
	transaction execute.

	"Assert"
	factory should receive createMaterial.
	factory should receive createCrusher.
	material should receive unwrap.
	material should receive into: crusher.
	crusher should receive turnOn.
	crusher should receive turnOff