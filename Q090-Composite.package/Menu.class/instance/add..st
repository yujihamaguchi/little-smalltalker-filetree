adding
add: aMenuComponent
	menuComponents ifNil: [ menuComponents := OrderedCollection new ].
	menuComponents add: aMenuComponent 