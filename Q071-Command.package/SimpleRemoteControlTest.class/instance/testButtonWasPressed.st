tests
testButtonWasPressed

	| target command |
	command := Mock new.

	target := SimpleRemoteControl new.
	target setCommand: command.

	target buttonWasPressed.

	command should receive execute