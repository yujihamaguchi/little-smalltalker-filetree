tests
testInto
| material crusher |
"Arrange"
material := Material new.
crusher := Mock new.
(crusher stub material: material) willReturnYourself.

"Act"
material into: crusher.

"Assert"
crusher should receive material: material