tests
testPushUndoButton

	| remoteControl undoCommand |
	undoCommand := Mock new.
	remoteControl := RemoteControl new.
	remoteControl stub undoCommand willReturn: undoCommand.
	
	"Act"
	remoteControl pushUndoButton.

	"Assert"
	remoteControl should receive undoCommand.
	undoCommand should receive execute