instance creation
current

    [ isProcessing ] whileTrue: [  ].
    isProcessing := true.
    current := current ifNil: [ 
                   (Delay forSeconds: 2) wait.
                   self new ].
    isProcessing := false.
    ^ current