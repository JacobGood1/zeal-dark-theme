Extension { #name : 'GtPostMortemSessionElement' }

{ #category : '*ZealTheme' }
GtPostMortemSessionElement >> newSummaryView [
	^ BrEditor new
		aptitude: BrGlamorousCodeEditorAptitude new + BrShadowAptitude new;
		background: (Color fromHexString: '#262626').
]
