tests
testExecute

	| target |
	stereo := Mock new.
	target := StereoOnCommand stereo: stereo.

	target execute.

	stereo should receive on once.
	stereo should receive setCD once.
	(stereo should receive setVolume: 11) once