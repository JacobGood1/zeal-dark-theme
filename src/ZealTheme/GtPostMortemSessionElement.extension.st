Extension { #name : 'GtPostMortemSessionElement' }

{ #category : '*ZealTheme' }
GtPostMortemSessionElement >> newSummaryView [
	^ BrEditor new
		aptitude: BrGlamorousCodeEditorAptitude new + BrShadowAptitude new;
		background: ZealDarkMode contentBackground.
]
