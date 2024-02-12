tests
testAsMenuString
	| menu subMenu item1 item2 item3 |
	menu := Menu new.
	menu name: 'Menu'.
	subMenu := Menu new.
	subMenu name: 'Food'.
	item1 := MenuItem name: 'foo'.
	item2 := MenuItem name: 'bar'.
	item3 := MenuItem name: 'baz'.
	menu add: item1.
	subMenu add: item2.
	subMenu add: item3.
	menu add: subMenu.
	
	self assert: (menu asMenuString: 0) equals: '
[Menu]
  foo
  [Food]
    bar
    baz
  [Drink]
    hoge
'
	