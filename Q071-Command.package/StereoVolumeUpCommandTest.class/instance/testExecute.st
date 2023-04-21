tests
testExecute

	| target stereo |
	stereo := Mock new.
	target := StereoVolumeUpCommand receiver: stereo.

	target execute.

	stereo should receive volumeUp