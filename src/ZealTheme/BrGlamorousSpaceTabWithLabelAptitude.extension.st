Extension { #name : 'BrGlamorousSpaceTabWithLabelAptitude' }

{ #category : '*ZealTheme' }
BrGlamorousSpaceTabWithLabelAptitude >> initialize [
	super initialize.
	
	self add: (BrGlamorousTextLabelAptitude new foreground: ZealDarkMode textColor).
	self add: BrGlamorousSpaceTabBasicAptitude new.
]
