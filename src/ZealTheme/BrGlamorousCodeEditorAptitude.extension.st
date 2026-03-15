Extension { #name : 'BrGlamorousCodeEditorAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousCodeEditorAptitude >> initialize [
	super initialize.
	self glamorousCodeDefaultFont.
	self foreground: ZealDarkMode textColor
]
