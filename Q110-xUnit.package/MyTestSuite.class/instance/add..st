adding
add: aTestCase
	tests ifNil: [ tests := OrderedCollection new ].
	tests add: aTestCase 