instance creation
uniqueInstance

	^ uniqueInstance ifNil: [ self initializeUniqueInstance ]