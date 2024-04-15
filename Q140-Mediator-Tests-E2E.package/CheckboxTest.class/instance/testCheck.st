tests
testCheck

	| authenticationDialog loginOrRegisterChkBx |
	"Arrange"
	authenticationDialog := AuthenticationDialog new.
	loginOrRegisterChkBx := Checkbox dialog: authenticationDialog.

	"Act"
	loginOrRegisterChkBx check.

	"Assert"
	self assert: authenticationDialog title equals: 'Log in'