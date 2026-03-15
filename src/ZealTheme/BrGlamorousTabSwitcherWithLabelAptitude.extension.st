Extension { #name : 'BrGlamorousTabSwitcherWithLabelAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousTabSwitcherWithLabelAptitude >> initialize [
	super initialize.
	self add: (BrGlamorousTextLabelAptitude new 
		foreground: ZealDarkMode textColor).
			
	self addChangeProperty: #(widget geometry) with: [ 
		BlStadiumGeometry new ].
]
