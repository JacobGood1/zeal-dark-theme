Extension { #name : 'BrGlamorousCodeEditorAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousCodeEditorAptitude >> initialize [
	super initialize.
	self glamorousCodeDefaultFont.
	self foreground: (Color white alpha: 0.85)
]
