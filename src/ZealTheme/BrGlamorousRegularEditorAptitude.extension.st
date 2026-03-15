Extension { #name : 'BrGlamorousRegularEditorAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousRegularEditorAptitude >> initialize [
	super initialize.
	self glamorousRegularDefaultFont.
	self foreground: ZealDarkMode textColor
]
