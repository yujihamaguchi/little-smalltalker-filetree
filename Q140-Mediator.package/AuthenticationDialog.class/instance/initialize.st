initialization
initialize

	super initialize.
	loginOrRegisterChkBx := LoginOrRegisterCheckbox dialog: self.
	loginForm := LoginForm dialog: self.
	registerForm := RegisterForm dialog: self.
	^ self