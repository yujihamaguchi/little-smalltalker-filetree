as yet unclassified
insertCoin

	[ state insertCoin: self ]
		on: CoinAlreadyInsertedException
		do: [ :ex | ex pass ]