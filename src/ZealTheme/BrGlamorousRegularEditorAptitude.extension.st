Extension { #name : 'BrGlamorousRegularEditorAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousRegularEditorAptitude >> initialize [
	super initialize.
	self glamorousRegularDefaultFont.
	self foreground: (Color white alpha: 0.85)
]
