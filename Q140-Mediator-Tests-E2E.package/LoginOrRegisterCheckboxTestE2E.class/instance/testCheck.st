tests
testCheck

	| authenticationDialog |
	"Arrange"
	authenticationDialog := AuthenticationDialog new.
	self assert: authenticationDialog loginForm isDisabled.
	self assert: authenticationDialog registerForm isEnabled.

	"Act"
	authenticationDialog loginOrRegisterChkBx check.

	"Assert"
	self assert: authenticationDialog title equals: 'Log in'.
	self assert: authenticationDialog loginForm isEnabled.
	self assert: authenticationDialog registerForm isDisabled