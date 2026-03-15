Extension { #name : 'GtCompletionController' }

{ #category : '*ZealTheme' }
GtCompletionController >> newPopupElement [
	^ GtCompletionPopupElement new
		layout: BlLinearLayout vertical;
		aptitude: BrShadowAptitude new;
		background: ZealDarkMode contentBackground;
		constraintsDo: [ :c |
			c vertical fitContentLimited.
			c horizontal fitContentLimited ]
]
