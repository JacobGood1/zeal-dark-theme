Extension { #name : 'BrGlamorousTabSwitcherWithLabelAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousTabSwitcherWithLabelAptitude >> initialize [
	super initialize.
	self add: (BrGlamorousTextLabelAptitude new 
		foreground: (Color white alpha: 0.85)).
			
	self addChangeProperty: #(widget geometry) with: [ 
		BlStadiumGeometry new ].
]
