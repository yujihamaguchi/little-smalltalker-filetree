instance creation
uniqueInstance

	mutex ifNil: [ mutex := Mutex new ].
	mutex critical: [ 
		uniqueInstance ifNil: [ uniqueInstance := self new ] ].
	^ uniqueInstance