Extension { #name : 'GtCompletionController' }

{ #category : '*ZealTheme' }
GtCompletionController >> newPopupElement [
	^ GtCompletionPopupElement new
		layout: BlLinearLayout vertical;
		aptitude: BrShadowAptitude new;
		background: (Color fromHexString: '#262626');
		constraintsDo: [ :c |
			c vertical fitContentLimited.
			c horizontal fitContentLimited ]
]
