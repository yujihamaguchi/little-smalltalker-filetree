tests
testAsMenuString
	| menu subMenu item1 item2 item3 |
	menu := Menu new.
	subMenu := Menu new.
	item1 := MenuItem name: 'foo'.
	item2 := MenuItem name: 'bar'.
	item3 := MenuItem name: 'baz'.
	menu add: item1.
	subMenu add: item2.
	subMenu add: item3.
	menu add: subMenu.
	
	self assert: menu asMenuString equals: 'foo, bar, baz'
	