Extension { #name : 'BrGlamorousSpaceTabWithLabelAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousSpaceTabWithLabelAptitude >> initialize [
	super initialize.
	
	self add: (BrGlamorousTextLabelAptitude new foreground: (Color white alpha: 0.85)).
	self add: BrGlamorousSpaceTabBasicAptitude new.
]
