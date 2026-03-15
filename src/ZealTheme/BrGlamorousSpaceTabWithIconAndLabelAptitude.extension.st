Extension { #name : 'BrGlamorousSpaceTabWithIconAndLabelAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousSpaceTabWithIconAndLabelAptitude >> initialize [
	super initialize.
	
	self add: BrGlamorousSpaceTabIconAptitude new.
	self add: (BrGlamorousTextLabelAptitude new foreground: (Color white alpha: 0.85)).
	self add: BrGlamorousSpaceTabBasicAptitude new.
]
