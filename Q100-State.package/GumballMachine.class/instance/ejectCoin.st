as yet unclassified
ejectCoin

	[ state ejectCoin: self ]
		on: NoCoinToEjectException
		do: [ :ex | ex pass ]